import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/error/exceptions.dart';
import '../models/job.dart';

abstract class JobRemoteDataSource {
  /// Gets all jobs for a contractor from the API
  Future<List<Job>> getJobs(String contractorId);

  /// Updates a job on the API
  Future<Job> updateJob(Job job);

  /// Uploads photos to the server
  Future<List<String>> uploadPhotos(
    String jobId,
    String taskId,
    List<String> localPhotoPaths
  );
}

class JobRemoteDataSourceImpl implements JobRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  JobRemoteDataSourceImpl({
    required this.client,
    this.baseUrl = 'https://api.example.com/v1', // Replace with actual API URL
  });

  @override
  Future<List<Job>> getJobs(String contractorId) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/contractors/$contractorId/jobs'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jobsJson = json.decode(response.body);
        return jobsJson.map((json) => Job.fromJson(json)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Job> updateJob(Job job) async {
    try {
      final response = await client.put(
        Uri.parse('$baseUrl/jobs/${job.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(job.toJson()),
      );

      if (response.statusCode == 200) {
        return Job.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<String>> uploadPhotos(
    String jobId,
    String taskId,
    List<String> localPhotoPaths,
  ) async {
    try {
      final uploadUrls = <String>[];
      
      for (final path in localPhotoPaths) {
        final request = http.MultipartRequest(
          'POST',
          Uri.parse('$baseUrl/jobs/$jobId/tasks/$taskId/photos'),
        );
        
        request.files.add(await http.MultipartFile.fromPath(
          'photo',
          path,
        ));

        final response = await request.send();
        final responseData = await response.stream.bytesToString();

        if (response.statusCode == 200) {
          final data = json.decode(responseData);
          uploadUrls.add(data['url']);
        } else {
          throw ServerException();
        }
      }

      return uploadUrls;
    } catch (e) {
      throw ServerException();
    }
  }
} 