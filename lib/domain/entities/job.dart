import 'package:equatable/equatable.dart';
import 'job_status.dart';
import 'geo_location.dart';

abstract class Job extends Equatable {
  String get id;
  String get customerId;
  String get customerName;
  String get address;
  DateTime get scheduledStartTime;
  DateTime get scheduledEndTime;
  List<String> get assignedContractors;
  JobStatus get status;
  List<Task> get tasks;
  String? get notes;
  DateTime? get actualStartTime;
  DateTime? get actualEndTime;
  bool get photosRequired;
  GeoLocation? get location;
  DateTime get createdAt;
  DateTime? get completedAt;

  bool get isFirstJobOfDay {
    final now = DateTime.now();
    return scheduledStartTime.year == now.year &&
           scheduledStartTime.month == now.month &&
           scheduledStartTime.day == now.day &&
           status == JobStatus.pending;
  }

  bool get canStart {
    final now = DateTime.now();
    final tenMinutesBeforeStart = scheduledStartTime.subtract(const Duration(minutes: 10));
    return now.isAfter(tenMinutesBeforeStart) && status == JobStatus.pending;
  }

  bool get isWithinGeofence => true;
  bool get isCompleted => status == JobStatus.completed;
  bool get isPending => status == JobStatus.pending;
  bool get isInProgress => status == JobStatus.inProgress;
  bool get isCancelled => status == JobStatus.cancelled;
  bool get isDelayed => status == JobStatus.delayed;

  double get completionPercentage {
    if (tasks.isEmpty) return 0;
    final completedTasks = tasks.where((task) => task.isCompleted).length;
    return (completedTasks / tasks.length) * 100;
  }

  Duration get duration => scheduledEndTime.difference(scheduledStartTime);

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
}

abstract class Task extends Equatable {
  String get id;
  String get title;
  String get description;
  bool get isCompleted;
  String? get completedBy;
  DateTime? get completedAt;
  List<String>? get photoUrls;
  List<String>? get pendingPhotos;

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