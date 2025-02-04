import 'package:image_picker/image_picker.dart';
import '../services/cloudinary_service.dart';

class ImageRepository {
  final CloudinaryService _cloudinaryService;
  final ImagePicker _imagePicker;

  ImageRepository({
    CloudinaryService? cloudinaryService,
    ImagePicker? imagePicker,
  })  : _cloudinaryService = cloudinaryService ?? CloudinaryService(),
        _imagePicker = imagePicker ?? ImagePicker();

  // Pick image from camera or gallery
  Future<XFile?> pickImage({required bool fromCamera}) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 85, // Compress image quality
      );
      return image;
    } catch (e) {
      throw Exception('Error picking image: $e');
    }
  }

  // Upload image to Cloudinary
  Future<Map<String, dynamic>> uploadImage(XFile image, {
    required String jobId,
    required bool isBefore,
  }) async {
    try {
      return await _cloudinaryService.uploadPhoto(
        image,
        type: isBefore ? PhotoType.before : PhotoType.after,
        jobId: jobId,
      );
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }

  // Get all photos for a job
  Future<List<Map<String, dynamic>>> getJobPhotos(String jobId) async {
    try {
      return await _cloudinaryService.getJobPhotos(jobId);
    } catch (e) {
      throw Exception('Error getting job photos: $e');
    }
  }

  // Delete a photo
  Future<void> deletePhoto(String photoId, String jobId) async {
    try {
      await _cloudinaryService.deletePhoto(photoId, jobId);
    } catch (e) {
      throw Exception('Error deleting photo: $e');
    }
  }

  // Get optimized URL for a photo
  String getOptimizedPhotoUrl(Map<String, dynamic> photo, {String size = 'medium'}) {
    return _cloudinaryService.getOptimizedUrl(photo, size: size);
  }

  // Upload profile photo
  Future<Map<String, dynamic>> uploadProfilePhoto(XFile image) async {
    try {
      return await _cloudinaryService.uploadPhoto(
        image,
        type: PhotoType.profile,
      );
    } catch (e) {
      throw Exception('Error uploading profile photo: $e');
    }
  }
} 