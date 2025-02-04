import 'package:dartz/dartz.dart';
import '../entities/job.dart';
import '../entities/geo_location.dart';
import '../../core/error/failures.dart';

abstract class JobRepository {
  /// Get all jobs for a contractor
  Future<Either<Failure, List<Job>>> getJobs();
  
  /// Get a specific job by ID
  Future<Either<Failure, Job>> getJob(String id);
  
  /// Start a job
  Future<Either<Failure, Job>> startJob(String jobId, DateTime startTime);
  
  /// Complete a job
  Future<Either<Failure, Job>> completeJob(String jobId, DateTime endTime);
  
  /// Update task status
  Future<Either<Failure, Job>> updateTaskStatus(
    String jobId, 
    String taskId, 
    bool isCompleted,
    String completedBy
  );
  
  /// Add notes to a job
  Future<Either<Failure, Job>> addNotes(String jobId, String notes);
  
  /// Upload photos for a task
  Future<Either<Failure, List<String>>> uploadTaskPhotos(
    String jobId,
    String taskId,
    List<String> localPhotoPaths
  );
  
  /// Check geofence status
  Future<Either<Failure, bool>> isWithinGeofence(
    String jobId,
    GeoLocation currentLocation
  );
  
  /// Get jobs for specific date range
  Future<Either<Failure, List<Job>>> getJobsForDateRange(
    String contractorId,
    DateTime startDate,
    DateTime endDate
  );
  
  /// Sync offline changes
  Future<Either<Failure, bool>> syncOfflineChanges();
  
  Future<Either<Failure, Job>> saveJob(Job job);
  Future<Either<Failure, bool>> deleteJob(String jobId);
  Future<Either<Failure, List<String>>> uploadPendingPhotos(String jobId, String taskId);
  Future<Either<Failure, bool>> addJob(Job job);
  Future<Either<Failure, Job>> updateJob(Job job);
  Future<Either<Failure, List<String>>> uploadPhotos(String jobId, List<String> photoPaths);
  Future<Either<Failure, Unit>> updateJobStatus(String id, String status);
  Future<Either<Failure, Unit>> updateJobLocation(String id, GeoLocation location);
  Future<Either<Failure, List<String>>> getPhotoUrls(String jobId);
} 