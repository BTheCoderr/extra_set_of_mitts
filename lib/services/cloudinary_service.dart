import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum PhotoType {
  before,
  after,
  profile,
  general
}

class CloudinaryService {
  static const String baseUrl = 'http://localhost:3000/api'; // Development URL

  // Upload photo with type
  Future<Map<String, dynamic>> uploadPhoto(XFile photo, {
    PhotoType type = PhotoType.general,
    String? jobId,
    bool isBatchUpload = false,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/photos${jobId != null ? '/jobs/$jobId' : '/profile'}');
      
      final request = http.MultipartRequest('POST', uri)
        ..fields['type'] = type.toString().split('.').last
        ..fields['batch'] = isBatchUpload.toString();

      final file = await http.MultipartFile.fromPath(
        'photo',
        photo.path,
        filename: photo.name,
      );
      request.files.add(file);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw HttpException('Failed to upload photo: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error uploading photo: $e');
    }
  }

  // Get photos for a job
  Future<List<Map<String, dynamic>>> getJobPhotos(String jobId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/photos/jobs/$jobId'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        throw HttpException('Failed to get job photos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting job photos: $e');
    }
  }

  // Delete a photo
  Future<void> deletePhoto(String photoId, String jobId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/photos/jobs/$jobId/$photoId'),
      );

      if (response.statusCode != 200) {
        throw HttpException('Failed to delete photo: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting photo: $e');
    }
  }

  // Get optimized URL for a specific size
  String getOptimizedUrl(Map<String, dynamic> photo, {
    String size = 'medium', // thumbnail, medium, large, square
  }) {
    final variants = photo['variants'] as Map<String, dynamic>?;
    if (variants != null && variants.containsKey(size)) {
      return variants[size] as String;
    }
    return photo['url'] as String; // fallback to original URL
  }
} 