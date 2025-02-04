import 'package:hive/hive.dart';

part 'job_status.g.dart';

@HiveType(typeId: 3)
enum JobStatus {
  @HiveField(0)
  pending,
  @HiveField(1)
  inProgress,
  @HiveField(2)
  completed,
  @HiveField(3)
  cancelled,
  @HiveField(4)
  delayed;

  String get value {
    switch (this) {
      case JobStatus.pending:
        return 'pending';
      case JobStatus.inProgress:
        return 'inProgress';
      case JobStatus.completed:
        return 'completed';
      case JobStatus.cancelled:
        return 'cancelled';
      case JobStatus.delayed:
        return 'delayed';
    }
  }

  static JobStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return JobStatus.pending;
      case 'inprogress':
        return JobStatus.inProgress;
      case 'completed':
        return JobStatus.completed;
      case 'cancelled':
        return JobStatus.cancelled;
      case 'delayed':
        return JobStatus.delayed;
      default:
        return JobStatus.pending;
    }
  }
} 