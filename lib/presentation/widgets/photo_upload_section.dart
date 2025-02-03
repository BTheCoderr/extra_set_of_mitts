import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploadSection extends StatelessWidget {
  final String jobId;
  final Function(List<String>) onPhotosSelected;

  const PhotoUploadSection({
    Key? key,
    required this.jobId,
    required this.onPhotosSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Photos',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => _pickImages(context),
              icon: const Icon(Icons.add_a_photo),
              label: const Text('Add Photos'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImages(BuildContext context) async {
    final picker = ImagePicker();
    try {
      final images = await picker.pickMultiImage();
      if (images != null && images.isNotEmpty) {
        onPhotosSelected(images.map((image) => image.path).toList());
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to pick images'),
        ),
      );
    }
  }
} 