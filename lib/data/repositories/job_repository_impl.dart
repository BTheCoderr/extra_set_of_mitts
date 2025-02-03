import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/network_info.dart';
import '../../domain/repositories/job_repository.dart';
import '../datasources/job_local_data_source.dart';
import '../datasources/job_remote_data_source.dart';
import '../models/job.dart';
import 'dart:math' as math;

class JobRepositoryImpl implements JobRepository {
  final JobRemoteDataSource remoteDataSource;
  final JobLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  JobRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Job>>> getJobs(String contractorId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteJobs = await remoteDataSource.getJobs(contractorId);
        await localDataSource.cacheJobs(remoteJobs);
        return Right(remoteJobs);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localJobs = await localDataSource.getLastCachedJobs();
        return Right(localJobs);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Job>> getJobById(String jobId) async {
    try {
      final job = await localDataSource.getJob(jobId);
      return Right(job);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Job>> startJob(String jobId, DateTime startTime) async {
    try {
      final job = await localDataSource.getJob(jobId);
      final updatedJob = job.copyWith(
        status: JobStatus.inProgress,
        actualStartTime: startTime,
      );
      
      await localDataSource.updateJob(updatedJob);
      
      if (await networkInfo.isConnected) {
        try {
          final remoteUpdatedJob = await remoteDataSource.updateJob(updatedJob);
          await localDataSource.updateJob(remoteUpdatedJob);
          return Right(remoteUpdatedJob);
        } on ServerException {
          return Right(updatedJob);
        }
      } else {
        return Right(updatedJob);
      }
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Job>> completeJob(String jobId, DateTime endTime) async {
    try {
      final job = await localDataSource.getJob(jobId);
      final updatedJob = job.copyWith(
        status: JobStatus.completed,
        actualEndTime: endTime,
      );
      
      await localDataSource.updateJob(updatedJob);
      
      if (await networkInfo.isConnected) {
        try {
          final remoteUpdatedJob = await remoteDataSource.updateJob(updatedJob);
          await localDataSource.updateJob(remoteUpdatedJob);
          return Right(remoteUpdatedJob);
        } on ServerException {
          return Right(updatedJob);
        }
      } else {
        return Right(updatedJob);
      }
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Job>> updateTaskStatus(
    String jobId,
    String taskId,
    bool isCompleted,
    String completedBy,
  ) async {
    try {
      final job = await localDataSource.getJob(jobId);
      final updatedTasks = job.tasks.map((task) {
        if (task.id == taskId) {
          return task.copyWith(
            isCompleted: isCompleted,
            completedBy: completedBy,
            completedAt: isCompleted ? DateTime.now() : null,
          );
        }
        return task;
      }).toList();

      final updatedJob = job.copyWith(tasks: updatedTasks);
      await localDataSource.updateJob(updatedJob);

      if (await networkInfo.isConnected) {
        try {
          final remoteUpdatedJob = await remoteDataSource.updateJob(updatedJob);
          await localDataSource.updateJob(remoteUpdatedJob);
          return Right(remoteUpdatedJob);
        } on ServerException {
          return Right(updatedJob);
        }
      } else {
        return Right(updatedJob);
      }
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Job>> addNotes(String jobId, String notes) async {
    try {
      final job = await localDataSource.getJob(jobId);
      final updatedJob = job.copyWith(notes: notes);
      
      await localDataSource.updateJob(updatedJob);
      
      if (await networkInfo.isConnected) {
        try {
          final remoteUpdatedJob = await remoteDataSource.updateJob(updatedJob);
          await localDataSource.updateJob(remoteUpdatedJob);
          return Right(remoteUpdatedJob);
        } on ServerException {
          return Right(updatedJob);
        }
      } else {
        return Right(updatedJob);
      }
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<Job>>> getJobsForDateRange(
    String contractorId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final allJobs = await remoteDataSource.getJobs(contractorId);
        final filteredJobs = allJobs.where((job) {
          return job.scheduledStartTime.isAfter(startDate) &&
                 job.scheduledStartTime.isBefore(endDate);
        }).toList();
        return Right(filteredJobs);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localJobs = await localDataSource.getLastCachedJobs();
        final filteredJobs = localJobs.where((job) {
          return job.scheduledStartTime.isAfter(startDate) &&
                 job.scheduledStartTime.isBefore(endDate);
        }).toList();
        return Right(filteredJobs);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, bool>> syncOfflineChanges() async {
    if (await networkInfo.isConnected) {
      try {
        final localJobs = await localDataSource.getLastCachedJobs();
        for (final job in localJobs) {
          await remoteDataSource.updateJob(job);
        }
        return const Right(true);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isWithinGeofence(
    String jobId,
    GeoLocation currentLocation
  ) async {
    try {
      final job = await localDataSource.getJob(jobId);
      if (job.location == null) return const Right(true);
      
      final distance = _calculateDistance(
        currentLocation,
        job.location!
      );
      
      // Allow 100 meters radius
      return Right(distance <= 100);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadTaskPhotos(
    String jobId,
    String taskId,
    List<String> localPhotoPaths
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final uploadedUrls = await remoteDataSource.uploadPhotos(
          jobId,
          taskId,
          localPhotoPaths
        );
        
        await localDataSource.cachePhotoUrls(jobId, taskId, uploadedUrls);
        return Right(uploadedUrls);
      } on ServerException {
        await localDataSource.cachePendingUploads(
          jobId,
          taskId,
          localPhotoPaths
        );
        return Left(ServerFailure());
      }
    } else {
      await localDataSource.cachePendingUploads(
        jobId,
        taskId,
        localPhotoPaths
      );
      return Right(localPhotoPaths);
    }
  }

  double _calculateDistance(GeoLocation loc1, GeoLocation loc2) {
    const double earthRadius = 6371000; // Earth's radius in meters
    
    // Convert latitude and longitude to radians
    final lat1 = loc1.latitude * math.pi / 180;
    final lat2 = loc2.latitude * math.pi / 180;
    final deltaLat = (loc2.latitude - loc1.latitude) * math.pi / 180;
    final deltaLon = (loc2.longitude - loc1.longitude) * math.pi / 180;

    // Haversine formula
    final a = math.sin(deltaLat / 2) * math.sin(deltaLat / 2) +
        math.cos(lat1) * math.cos(lat2) *
        math.sin(deltaLon / 2) * math.sin(deltaLon / 2);
    
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    
    // Calculate distance in meters
    return earthRadius * c;
  }
} 