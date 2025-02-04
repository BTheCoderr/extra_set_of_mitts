import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'photo.g.dart';

@HiveType(typeId: 2)
class Photo extends Equatable {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String url;
  
  @HiveField(2)
  final String type; // 'before' or 'after'
  
  @HiveField(3)
  final DateTime timestamp;
  
  @HiveField(4)
  final Map<String, String>? variants; // Different sizes: thumbnail, medium, large
  
  @HiveField(5)
  final String? notes;
  
  @HiveField(6)
  final Map<String, dynamic>? metadata; // Cloudinary metadata
  
  @HiveField(7)
  final String uploadedBy;

  const Photo({
    required this.id,
    required this.url,
    required this.type,
    required this.timestamp,
    required this.uploadedBy,
    this.variants,
    this.notes,
    this.metadata,
  });

  String getVariant(String size) {
    return variants?[size] ?? url;
  }

  Photo copyWith({
    String? id,
    String? url,
    String? type,
    DateTime? timestamp,
    String? uploadedBy,
    Map<String, String>? variants,
    String? notes,
    Map<String, dynamic>? metadata,
  }) {
    return Photo(
      id: id ?? this.id,
      url: url ?? this.url,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      uploadedBy: uploadedBy ?? this.uploadedBy,
      variants: variants ?? this.variants,
      notes: notes ?? this.notes,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  List<Object?> get props => [
        id,
        url,
        type,
        timestamp,
        uploadedBy,
        variants,
        notes,
        metadata,
      ];
} 