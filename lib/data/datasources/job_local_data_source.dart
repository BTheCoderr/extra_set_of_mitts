import 'dart:convert';
import 'package:hive/hive.dart';
import '../../core/error/exceptions.dart';
import '../models/job.dart';

abstract class JobLocalDataSource {
  /// Gets the cached list of jobs
  Future<List<JobModel>> getJobs();

  /// Gets a specific job by ID
  Future<JobModel?> getJob(String id);

  /// Caches a specific job
  Future<void> cacheJob(JobModel job);

  /// Caches the list of jobs
  Future<void> cacheJobs(List<JobModel> jobs);

  /// Deletes a specific job
  Future<void> deleteJob(String id);

  /// Gets the list of pending photo paths
  Future<List<String>> getPendingPhotos();

  /// Marks a photo as uploaded
  Future<void> markPhotoAsUploaded(String photoPath);

  /// Gets the list of last cached jobs
  Future<List<JobModel>> getLastCachedJobs();

  /// Updates a job
  Future<void> updateJob(JobModel job);

  /// Caches photo URLs for a job
  Future<void> cachePhotoUrls(String jobId, String taskId, List<String> urls);

  /// Caches pending uploads for a job
  Future<void> cachePendingUploads(String jobId, String taskId, List<String> localPaths);

  Future<List<JobModel>> getLastJobs();

  Future<bool> syncOfflineChanges();

  Future<List<dynamic>> getPendingChanges();

  Future<void> clearPendingChanges();
}

class JobLocalDataSourceImpl implements JobLocalDataSource {
  final Box<JobModel> jobsBox;
  final Box<List<String>> pendingUploadsBox;
  final Box<List<String>> photoUrlsBox;

  JobLocalDataSourceImpl({
    required this.jobsBox,
    required this.pendingUploadsBox,
    required this.photoUrlsBox,
  });

  @override
  Future<List<JobModel>> getJobs() async {
    return jobsBox.values.toList();
  }

  @override
  Future<JobModel?> getJob(String id) async {
    return jobsBox.get(id);
  }

  @override
  Future<void> cacheJob(JobModel job) async {
    await jobsBox.put(job.id, job);
  }

  @override
  Future<void> cacheJobs(List<JobModel> jobs) async {
    await jobsBox.clear();
    for (var job in jobs) {
      await jobsBox.put(job.id, job);
    }
  }

  @override
  Future<void> deleteJob(String id) async {
    await jobsBox.delete(id);
  }

  @override
  Future<List<String>> getPendingPhotos() async {
    final allPendingUploads = pendingUploadsBox.values;
    return allPendingUploads.expand((paths) => paths).toList();
  }

  @override
  Future<void> markPhotoAsUploaded(String photoPath) async {
    for (final key in pendingUploadsBox.keys) {
      final paths = pendingUploadsBox.get(key);
      if (paths != null && paths.contains(photoPath)) {
        paths.remove(photoPath);
        if (paths.isEmpty) {
          await pendingUploadsBox.delete(key);
        } else {
          await pendingUploadsBox.put(key, paths);
        }
        break;
      }
    }
  }

  @override
  Future<List<JobModel>> getLastCachedJobs() async {
    return getJobs();
  }

  @override
  Future<void> updateJob(JobModel job) async {
    await jobsBox.put(job.id, job);
  }

  @override
  Future<void> cachePhotoUrls(String jobId, String taskId, List<String> urls) async {
    final job = await getJob(jobId);
    if (job != null) {
      final updatedJob = job.copyWith(
        tasks: job.tasks.map((task) {
          if (task.id == taskId) {
            return task.copyWith(
              photoUrls: [...task.photoUrls ?? [], ...urls],
            );
          }
          return task;
        }).toList(),
      );
      await updateJob(updatedJob);
    }
  }

  @override
  Future<void> cachePendingUploads(String jobId, String taskId, List<String> localPaths) async {
    final key = '${jobId}_${taskId}_pending';
    final existingPaths = pendingUploadsBox.get(key) ?? [];
    await pendingUploadsBox.put(key, [...existingPaths, ...localPaths]);
  }

  @override
  Future<List<JobModel>> getLastJobs() async {
    return getJobs();
  }

  @override
  Future<bool> syncOfflineChanges() async {
    try {
      final pendingChanges = await getPendingChanges();
      if (pendingChanges.isEmpty) {
        return true;
      }

      for (final change in pendingChanges) {
        // Implement sync logic here
        await _syncChange(change);
      }

      await clearPendingChanges();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> _syncChange(dynamic change) async {
    // Implement the sync logic for each change
    // This is a placeholder - implement actual sync logic
  }

  @override
  Future<List<dynamic>> getPendingChanges() async {
    // Implement getting pending changes from storage
    return [];
  }

  @override
  Future<void> clearPendingChanges() async {
    // Implement clearing pending changes from storage
  }
} 