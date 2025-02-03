import 'package:hive/hive.dart';
import '../../core/error/exceptions.dart';
import '../models/job.dart';

abstract class JobLocalDataSource {
  /// Gets the cached list of jobs
  Future<List<Job>> getLastCachedJobs();

  /// Gets a specific job by ID
  Future<Job> getJob(String jobId);

  /// Caches the list of jobs
  Future<void> cacheJobs(List<Job> jobsToCache);

  /// Updates a specific job
  Future<void> updateJob(Job job);

  /// Caches photo URLs for a task
  Future<void> cachePhotoUrls(String jobId, String taskId, List<String> urls);

  /// Caches pending photo uploads
  Future<void> cachePendingUploads(
    String jobId,
    String taskId,
    List<String> localPaths
  );
}

class JobLocalDataSourceImpl implements JobLocalDataSource {
  final Box<Job> jobsBox;
  final Box<List<String>> pendingUploadsBox;
  final Box<List<String>> photoUrlsBox;

  JobLocalDataSourceImpl({
    required this.jobsBox,
    required this.pendingUploadsBox,
    required this.photoUrlsBox,
  });

  @override
  Future<List<Job>> getLastCachedJobs() async {
    try {
      return jobsBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<Job> getJob(String jobId) async {
    try {
      final job = jobsBox.get(jobId);
      if (job == null) throw CacheException();
      return job;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheJobs(List<Job> jobsToCache) async {
    try {
      await jobsBox.clear();
      for (final job in jobsToCache) {
        await jobsBox.put(job.id, job);
      }
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> updateJob(Job job) async {
    try {
      await jobsBox.put(job.id, job);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> cachePhotoUrls(
    String jobId,
    String taskId,
    List<String> urls
  ) async {
    try {
      final key = '${jobId}_${taskId}';
      await photoUrlsBox.put(key, urls);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> cachePendingUploads(
    String jobId,
    String taskId,
    List<String> localPaths
  ) async {
    try {
      final key = '${jobId}_${taskId}';
      await pendingUploadsBox.put(key, localPaths);
    } catch (e) {
      throw CacheException();
    }
  }
} 