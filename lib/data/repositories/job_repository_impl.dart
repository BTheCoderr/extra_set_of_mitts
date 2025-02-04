import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../core/error/exceptions.dart';
import '../../domain/entities/job.dart';
import '../../domain/entities/geo_location.dart';
import '../../domain/entities/job_status.dart';
import '../../domain/repositories/job_repository.dart';
import '../datasources/job_local_data_source.dart';
import '../datasources/job_remote_data_source.dart';
import '../models/job.dart';

class JobRepositoryImpl implements JobRepository {
  final JobRemoteDataSource remoteDataSource;
  final JobLocalDataSource localDataSource;

  JobRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Job>>> getJobs() async {
    try {
      final jobs = await remoteDataSource.getJobs();
      await localDataSource.cacheJobs(jobs);
      return Right(jobs);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Job>> getJob(String id) async {
    try {
      final job = await remoteDataSource.getJob(id);
      await localDataSource.cacheJob(job);
      return Right(job);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Job>> startJob(String jobId, DateTime startTime) async {
    try {
      final job = await remoteDataSource.getJob(jobId);
      final updatedJob = JobModel.fromDomain(job).copyWith(
        actualStartTime: startTime,
        status: JobStatus.inProgress,
      );
      final result = await remoteDataSource.updateJob(updatedJob);
      await localDataSource.cacheJob(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Job>> completeJob(String jobId, DateTime endTime) async {
    try {
      final job = await remoteDataSource.getJob(jobId);
      final updatedJob = JobModel.fromDomain(job).copyWith(
        actualEndTime: endTime,
        status: JobStatus.completed,
        completedAt: endTime,
      );
      final result = await remoteDataSource.updateJob(updatedJob);
      await localDataSource.cacheJob(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
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
      final job = await remoteDataSource.getJob(jobId);
      final updatedTasks = job.tasks.map((task) {
        if (task.id == taskId) {
          return (task as CleaningTask).copyWith(
            isCompleted: isCompleted,
            completedBy: completedBy,
            completedAt: isCompleted ? DateTime.now() : null,
          );
        }
        return task;
      }).toList();
      
      final updatedJob = JobModel.fromDomain(job).copyWith(tasks: updatedTasks);
      final result = await remoteDataSource.updateJob(updatedJob);
      await localDataSource.cacheJob(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Job>> addNotes(String jobId, String notes) async {
    try {
      final job = await remoteDataSource.getJob(jobId);
      final updatedJob = JobModel.fromDomain(job).copyWith(notes: notes);
      final result = await remoteDataSource.updateJob(updatedJob);
      await localDataSource.cacheJob(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadTaskPhotos(
    String jobId,
    String taskId,
    List<String> localPhotoPaths,
  ) async {
    try {
      final uploadedUrls = await remoteDataSource.uploadPhotos(jobId, localPhotoPaths);
      final job = await remoteDataSource.getJob(jobId);
      
      final updatedTasks = job.tasks.map((task) {
        if (task.id == taskId) {
          final currentUrls = task.photoUrls ?? [];
          return (task as CleaningTask).copyWith(
            photoUrls: [...currentUrls, ...uploadedUrls],
          );
        }
        return task;
      }).toList();
      
      final updatedJob = JobModel.fromDomain(job).copyWith(tasks: updatedTasks);
      await remoteDataSource.updateJob(updatedJob);
      await localDataSource.cacheJob(updatedJob);
      return Right(uploadedUrls);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> isWithinGeofence(
    String jobId,
    GeoLocation currentLocation,
  ) async {
    try {
      final job = await remoteDataSource.getJob(jobId);
      if (job.location == null) {
        return const Right(true);
      }
      
      final distance = calculateDistance(currentLocation, job.location!);
      return Right(distance <= 100); // 100 meters radius
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on LocationException catch (e) {
      return Left(LocationFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<Job>>> getJobsForDateRange(
    String contractorId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final jobs = await remoteDataSource.getJobsForDateRange(
        contractorId,
        startDate,
        endDate,
      );
      await localDataSource.cacheJobs(jobs);
      return Right(jobs);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> syncOfflineChanges() async {
    try {
      final success = await localDataSource.syncOfflineChanges();
      return Right(success);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Job>> saveJob(Job job) async {
    try {
      final jobModel = JobModel.fromDomain(job);
      final result = await remoteDataSource.saveJob(jobModel);
      await localDataSource.cacheJob(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteJob(String jobId) async {
    try {
      final success = await remoteDataSource.deleteJob(jobId);
      if (success) {
        await localDataSource.deleteJob(jobId);
      }
      return Right(success);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadPendingPhotos(
    String jobId,
    String taskId,
  ) async {
    try {
      final job = await remoteDataSource.getJob(jobId);
      final task = job.tasks.firstWhere((t) => t.id == taskId);
      if (task.pendingPhotos == null || task.pendingPhotos!.isEmpty) {
        return const Right([]);
      }
      
      final uploadedUrls = await remoteDataSource.uploadPhotos(jobId, task.pendingPhotos!);
      final updatedTasks = job.tasks.map((t) {
        if (t.id == taskId) {
          final currentUrls = t.photoUrls ?? [];
          return (t as CleaningTask).copyWith(
            photoUrls: [...currentUrls, ...uploadedUrls],
            pendingPhotos: [],
          );
        }
        return t;
      }).toList();
      
      final updatedJob = JobModel.fromDomain(job).copyWith(tasks: updatedTasks);
      await remoteDataSource.updateJob(updatedJob);
      await localDataSource.cacheJob(updatedJob);
      return Right(uploadedUrls);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> addJob(Job job) async {
    try {
      final jobModel = JobModel.fromDomain(job);
      final result = await remoteDataSource.addJob(jobModel);
      if (result) {
        await localDataSource.cacheJob(jobModel);
      }
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Job>> updateJob(Job job) async {
    try {
      final jobModel = JobModel.fromDomain(job);
      final result = await remoteDataSource.updateJob(jobModel);
      await localDataSource.cacheJob(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadPhotos(
    String jobId,
    List<String> photoPaths,
  ) async {
    try {
      final uploadedUrls = await remoteDataSource.uploadPhotos(jobId, photoPaths);
      return Right(uploadedUrls);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateJobStatus(String id, String status) async {
    try {
      final job = await remoteDataSource.getJob(id);
      final updatedJob = JobModel.fromDomain(job).copyWith(
        status: JobStatus.fromString(status),
      );
      await remoteDataSource.updateJob(updatedJob);
      await localDataSource.cacheJob(updatedJob);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateJobLocation(String id, GeoLocation location) async {
    try {
      final job = await remoteDataSource.getJob(id);
      final updatedJob = JobModel.fromDomain(job).copyWith(
        location: location,
      );
      await remoteDataSource.updateJob(updatedJob);
      await localDataSource.cacheJob(updatedJob);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getPhotoUrls(String jobId) async {
    try {
      final job = await remoteDataSource.getJob(jobId);
      final allPhotoUrls = job.tasks
          .expand((task) => task.photoUrls ?? [])
          .map((url) => url as String)
          .toList();
      return Right(allPhotoUrls);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  double calculateDistance(GeoLocation point1, GeoLocation point2) {
    // Implement distance calculation using Haversine formula
    // This is a placeholder - implement actual distance calculation
    return 0.0;
  }
} 