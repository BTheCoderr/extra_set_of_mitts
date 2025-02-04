import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/entities/photo.dart';
import 'photo_comparison_view.dart';

class PhotoUploadSection extends StatelessWidget {
  final String jobId;
  final List<Photo> existingPhotos;
  final Function(List<XFile>) onPhotosUploaded;

  const PhotoUploadSection({
    Key? key,
    required this.jobId,
    required this.existingPhotos,
    required this.onPhotosUploaded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beforePhotos = existingPhotos.where((p) => p.type == 'before').toList();
    final afterPhotos = existingPhotos.where((p) => p.type == 'after').toList();

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
            const SizedBox(height: 16),
            
            // Before Photos Section
            _buildPhotoSection(
              context,
              'Before',
              beforePhotos,
              () => _pickImage(context, true),
            ),

            const Divider(height: 32),

            // After Photos Section
            _buildPhotoSection(
              context,
              'After',
              afterPhotos,
              () => _pickImage(context, false),
            ),

            if (beforePhotos.isNotEmpty && afterPhotos.isNotEmpty) ...[
              const Divider(height: 32),
              PhotoComparisonView(
                beforePhotos: beforePhotos,
                afterPhotos: afterPhotos,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoSection(
    BuildContext context,
    String title,
    List<Photo> photos,
    VoidCallback onAdd,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$title Photos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            IconButton(
              icon: const Icon(Icons.add_a_photo),
              onPressed: onAdd,
            ),
          ],
        ),
        if (photos.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'No $title photos yet',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          )
        else
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () => _showFullScreenImage(context, photos[index]),
                    child: Hero(
                      tag: photos[index].id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          photos[index].url,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Future<void> _pickImage(BuildContext context, bool isBefore) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();
    
    if (images.isNotEmpty) {
      onPhotosUploaded(images);
    }
  }

  void _showFullScreenImage(BuildContext context, Photo photo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          body: Center(
            child: Hero(
              tag: photo.id,
              child: Image.network(
                photo.url,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
} 