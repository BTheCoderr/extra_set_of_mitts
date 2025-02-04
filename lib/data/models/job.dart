import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/job.dart';
import '../../domain/entities/job_status.dart';
import '../../domain/entities/geo_location.dart';

part 'job.freezed.dart';
part 'job.g.dart';

@freezed
@HiveType(typeId: 8)
class JobModel with _$JobModel implements Job {
  const factory JobModel({
    @HiveField(0) required String id,
    @HiveField(1) required String customerId,
    @HiveField(2) required String customerName,
    @HiveField(3) required String address,
    @HiveField(4) required DateTime scheduledStartTime,
    @HiveField(5) required DateTime scheduledEndTime,
    @HiveField(6) required List<String> assignedContractors,
    @HiveField(7) required JobStatus status,
    @HiveField(8) @Default([]) List<CleaningTask> tasks,
    @HiveField(9) String? notes,
    @HiveField(10) DateTime? actualStartTime,
    @HiveField(11) DateTime? actualEndTime,
    @HiveField(12) @Default(false) bool photosRequired,
    @HiveField(13) GeoLocation? location,
    @HiveField(14) required DateTime createdAt,
    @HiveField(15) DateTime? completedAt,
  }) = _JobModel;

  const JobModel._();

  factory JobModel.fromJson(Map<String, dynamic> json) => _$JobModelFromJson(json);

  factory JobModel.fromDomain(Job job) {
    return JobModel(
      id: job.id,
      customerId: job.customerId,
      customerName: job.customerName,
      address: job.address,
      scheduledStartTime: job.scheduledStartTime,
      scheduledEndTime: job.scheduledEndTime,
      assignedContractors: job.assignedContractors,
      status: job.status,
      tasks: job.tasks.map((task) => CleaningTask.fromDomain(task)).toList(),
      notes: job.notes,
      actualStartTime: job.actualStartTime,
      actualEndTime: job.actualEndTime,
      photosRequired: job.photosRequired,
      location: job.location,
      createdAt: job.createdAt,
      completedAt: job.completedAt,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
    id,
    customerId,
    customerName,
    address,
    scheduledStartTime,
    scheduledEndTime,
    assignedContractors,
    status,
    tasks,
    notes,
    actualStartTime,
    actualEndTime,
    photosRequired,
    location,
    createdAt,
    completedAt,
  ];

  @override
  bool get isFirstJobOfDay {
    final now = DateTime.now();
    return scheduledStartTime.year == now.year &&
           scheduledStartTime.month == now.month &&
           scheduledStartTime.day == now.day &&
           status == JobStatus.pending;
  }

  @override
  bool get canStart {
    final now = DateTime.now();
    final tenMinutesBeforeStart = scheduledStartTime.subtract(const Duration(minutes: 10));
    return now.isAfter(tenMinutesBeforeStart) && status == JobStatus.pending;
  }

  @override
  bool get isWithinGeofence => true;

  @override
  bool get isCompleted => status == JobStatus.completed;

  @override
  bool get isPending => status == JobStatus.pending;

  @override
  bool get isInProgress => status == JobStatus.inProgress;

  @override
  bool get isCancelled => status == JobStatus.cancelled;

  @override
  bool get isDelayed => status == JobStatus.delayed;

  @override
  double get completionPercentage {
    if (tasks.isEmpty) return 0;
    final completedTasks = tasks.where((task) => task.isCompleted).length;
    return (completedTasks / tasks.length) * 100;
  }

  @override
  Duration get duration => scheduledEndTime.difference(scheduledStartTime);
}

@freezed
@HiveType(typeId: 9)
class CleaningTask with _$CleaningTask implements Task {
  const factory CleaningTask({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required String description,
    @HiveField(3) @Default(false) bool isCompleted,
    @HiveField(4) String? completedBy,
    @HiveField(5) DateTime? completedAt,
    @HiveField(6) List<String>? photoUrls,
    @HiveField(7) List<String>? pendingPhotos,
  }) = _CleaningTask;

  const CleaningTask._();

  factory CleaningTask.fromJson(Map<String, dynamic> json) => _$CleaningTaskFromJson(json);

  factory CleaningTask.fromDomain(Task task) {
    return CleaningTask(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: task.isCompleted,
      completedBy: task.completedBy,
      completedAt: task.completedAt,
      photoUrls: task.photoUrls,
      pendingPhotos: task.pendingPhotos,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    isCompleted,
    completedBy,
    completedAt,
    photoUrls,
    pendingPhotos,
  ];
}

@HiveType(typeId: 2)
enum TaskType {
  @HiveField(0)
  general,
} 