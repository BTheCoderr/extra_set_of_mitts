import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'job.freezed.dart';
part 'job.g.dart';

@freezed
class Job with _$Job {
  const factory Job({
    required String id,
    required String customerId,
    required String customerName,
    required String address,
    required DateTime scheduledStartTime,
    required DateTime scheduledEndTime,
    required List<String> assignedContractors,
    required JobStatus status,
    required List<CleaningTask> tasks,
    String? notes,
    DateTime? actualStartTime,
    DateTime? actualEndTime,
    @Default(false) bool requiresKey,
    @Default(false) bool photosRequired,
    GeoLocation? location,
  }) = _Job;

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}

@freezed
class CleaningTask with _$CleaningTask {
  const factory CleaningTask({
    required String id,
    required String name,
    required bool isCompleted,
    required TaskType type,
    String? notes,
    List<String>? photoUrls,
    DateTime? completedAt,
    String? completedBy,
  }) = _CleaningTask;

  factory CleaningTask.fromJson(Map<String, dynamic> json) => 
    _$CleaningTaskFromJson(json);
}

@freezed
class GeoLocation with _$GeoLocation {
  const factory GeoLocation({
    required double latitude,
    required double longitude,
    double? accuracy,
  }) = _GeoLocation;

  factory GeoLocation.fromJson(Map<String, dynamic> json) => 
    _$GeoLocationFromJson(json);
}

enum JobStatus {
  pending,
  inProgress,
  completed,
  cancelled,
  delayed
}

enum TaskType {
  general,
  deep,
  custom
} 