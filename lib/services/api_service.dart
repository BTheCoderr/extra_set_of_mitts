import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000/api'; // Development URL
  // static const String baseUrl = 'https://your-production-url.com/api'; // Production URL

  // Upload image to the server
  Future<Map<String, dynamic>> uploadImage(XFile image) async {
    try {
      final uri = Uri.parse('$baseUrl/upload');
      final request = http.MultipartRequest('POST', uri);

      // Add the image file to the request
      final file = await http.MultipartFile.fromPath(
        'image',
        image.path,
        filename: image.name,
      );
      request.files.add(file);

      // Send the request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw HttpException('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }

  // Process image with specific parameters
  Future<Map<String, dynamic>> processImage(String imageId, Map<String, dynamic> params) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/process/$imageId'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(params),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw HttpException('Failed to process image: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error processing image: $e');
    }
  }

  // Get processed image result
  Future<String> getProcessedImage(String imageId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/images/$imageId'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['url'];
      } else {
        throw HttpException('Failed to get processed image: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting processed image: $e');
    }
  }
} 