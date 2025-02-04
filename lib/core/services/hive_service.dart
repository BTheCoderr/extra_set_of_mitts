import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../../data/models/job.dart';
import '../../domain/entities/job_status.dart';
import '../../domain/entities/geo_location.dart';

class HiveService {
  final Box<JobModel> jobsBox;
  final Box<List<String>> pendingUploadsBox;
  final Box<List<String>> photoUrlsBox;

  static const String JOBS_BOX = 'jobs';
  static const String PENDING_UPLOADS_BOX = 'pending_uploads';
  static const String PHOTO_URLS_BOX = 'photo_urls';

  HiveService({
    required this.jobsBox,
    required this.pendingUploadsBox,
    required this.photoUrlsBox,
  });

  static Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    
    // Register adapters
    if (!Hive.isAdapterRegistered(8)) {
      Hive.registerAdapter(JobModelAdapter());
    }
    if (!Hive.isAdapterRegistered(9)) {
      Hive.registerAdapter(CleaningTaskAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(JobStatusAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(GeoLocationAdapter());
    }
    
    // Open boxes
    await Hive.openBox<JobModel>(JOBS_BOX);
    await Hive.openBox<List<String>>(PENDING_UPLOADS_BOX);
    await Hive.openBox<List<String>>(PHOTO_URLS_BOX);
  }

  // Jobs
  Future<void> saveJob(JobModel job) async {
    await jobsBox.put(job.id, job);
  }

  Future<JobModel?> getJob(String id) async {
    return jobsBox.get(id);
  }

  Future<List<JobModel>> getJobs() async {
    return jobsBox.values.toList();
  }

  Future<void> deleteJob(String id) async {
    await jobsBox.delete(id);
  }

  // Clear all data
  Future<void> clearAllData() async {
    await jobsBox.clear();
    await pendingUploadsBox.clear();
    await photoUrlsBox.clear();
  }

  Future<void> savePendingUploads(String key, List<String> paths) async {
    await pendingUploadsBox.put(key, paths);
  }

  Future<List<String>?> getPendingUploads(String key) async {
    return pendingUploadsBox.get(key);
  }

  Future<void> deletePendingUploads(String key) async {
    await pendingUploadsBox.delete(key);
  }

  Future<void> savePhotoUrls(String jobId, List<String> urls) async {
    await photoUrlsBox.put(jobId, urls);
  }

  Future<void> deletePhotoUrls(String jobId) async {
    await photoUrlsBox.delete(jobId);
  }

  Future<List<String>?> getPhotoUrls(String jobId) async {
    return photoUrlsBox.get(jobId);
  }
} 