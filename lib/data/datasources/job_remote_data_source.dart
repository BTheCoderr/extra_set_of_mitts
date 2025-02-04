import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/error/exceptions.dart';
import '../models/job.dart';

abstract class JobRemoteDataSource {
  /// Gets all jobs for a contractor from the API
  Future<List<JobModel>> getJobs();

  /// Updates a job on the API
  Future<JobModel> updateJob(JobModel job);

  /// Uploads photos to the server
  Future<List<String>> uploadPhotos(String jobId, List<String> photoPaths);

  Future<JobModel> getJob(String id);
  Future<JobModel> saveJob(JobModel job);
  Future<bool> deleteJob(String jobId);
  Future<void> uploadPhoto(String photoPath);
  Future<bool> addJob(JobModel job);
  Future<List<JobModel>> getJobsForDateRange(String contractorId, DateTime startDate, DateTime endDate);
}

class JobRemoteDataSourceImpl implements JobRemoteDataSource {
  final http.Client client;
  final String baseUrl = 'http://localhost:3000/api/v1';

  JobRemoteDataSourceImpl({required this.client});

  @override
  Future<List<JobModel>> getJobs() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/jobs'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jobsJson = json.decode(response.body);
        return jobsJson.map((json) => JobModel.fromJson(json)).toList();
      }
      throw ServerException(message: 'Failed to load jobs');
    } catch (e) {
      throw ServerException(message: 'Failed to load jobs: ${e.toString()}');
    }
  }

  @override
  Future<bool> addJob(JobModel job) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/jobs'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(job.toJson()),
      );

      if (response.statusCode == 201) {
        return true;
      }
      throw ServerException(message: 'Failed to add job');
    } catch (e) {
      throw ServerException(message: 'Failed to add job: ${e.toString()}');
    }
  }

  @override
  Future<JobModel> updateJob(JobModel job) async {
    try {
      final response = await client.put(
        Uri.parse('$baseUrl/jobs/${job.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(job.toJson()),
      );

      if (response.statusCode == 200) {
        return JobModel.fromJson(json.decode(response.body));
      }
      throw ServerException(message: 'Failed to update job');
    } catch (e) {
      throw ServerException(message: 'Failed to update job: ${e.toString()}');
    }
  }

  @override
  Future<bool> deleteJob(String jobId) async {
    try {
      final response = await client.delete(
        Uri.parse('$baseUrl/jobs/$jobId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return true;
      }
      throw ServerException(message: 'Failed to delete job');
    } catch (e) {
      throw ServerException(message: 'Failed to delete job: ${e.toString()}');
    }
  }

  @override
  Future<List<String>> uploadPhotos(String jobId, List<String> photoPaths) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/jobs/$jobId/photos'),
      );

      for (var path in photoPaths) {
        request.files.add(await http.MultipartFile.fromPath('photos', path));
      }

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final List<dynamic> urls = json.decode(responseBody);
        return urls.cast<String>();
      }
      throw ServerException(message: 'Failed to upload photos');
    } catch (e) {
      throw ServerException(message: 'Failed to upload photos: ${e.toString()}');
    }
  }

  @override
  Future<JobModel> getJob(String id) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/jobs/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return JobModel.fromJson(json.decode(response.body));
      }
      throw ServerException(message: 'Failed to load job');
    } catch (e) {
      throw ServerException(message: 'Failed to load job: ${e.toString()}');
    }
  }

  @override
  Future<JobModel> saveJob(JobModel job) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/jobs'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(job.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return JobModel.fromJson(json.decode(response.body));
      }
      throw ServerException(message: 'Failed to save job');
    } catch (e) {
      throw ServerException(message: 'Failed to save job: ${e.toString()}');
    }
  }

  @override
  Future<void> uploadPhoto(String photoPath) async {
    final response = await client.post(
      Uri.parse('$baseUrl/photos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'path': photoPath}),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ServerException(message: 'Failed to upload photo');
    }
  }

  @override
  Future<List<JobModel>> getJobsForDateRange(
    String contractorId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final uri = Uri.parse('$baseUrl/jobs').replace(
        queryParameters: {
          'contractorId': contractorId,
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
        },
      );
      
      final response = await client.get(uri);
      
      if (response.statusCode == 200) {
        final List<dynamic> jobsJson = json.decode(response.body);
        return jobsJson.map((json) => JobModel.fromJson(json)).toList();
      }
      throw ServerException(message: 'Failed to load jobs for date range');
    } catch (e) {
      throw ServerException(message: 'Failed to load jobs for date range: ${e.toString()}');
    }
  }
} 