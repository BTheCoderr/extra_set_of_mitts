import 'package:flutter/material.dart';
import '../../domain/entities/photo.dart';

class PhotoComparisonView extends StatelessWidget {
  final List<Photo> beforePhotos;
  final List<Photo> afterPhotos;

  const PhotoComparisonView({
    Key? key,
    required this.beforePhotos,
    required this.afterPhotos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Before & After Comparison',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: beforePhotos.length.clamp(0, afterPhotos.length),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: _ComparisonCard(
                  beforePhoto: beforePhotos[index],
                  afterPhoto: afterPhotos[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ComparisonCard extends StatelessWidget {
  final Photo beforePhoto;
  final Photo afterPhoto;

  const _ComparisonCard({
    Key? key,
    required this.beforePhoto,
    required this.afterPhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPhoto(context, beforePhoto, 'Before'),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, color: Colors.grey),
                const SizedBox(width: 8),
                _buildPhoto(context, afterPhoto, 'After'),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Tap to view full size',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoto(BuildContext context, Photo photo, String label) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () => _showFullScreenImage(context, photo),
          child: Hero(
            tag: '${photo.id}_comparison',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                photo.url,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
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
              tag: '${photo.id}_comparison',
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