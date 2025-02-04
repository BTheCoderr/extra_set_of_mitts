import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'task.dart';
import 'photo.dart';
import '../../../../data/models/job.dart' show JobStatus;

part 'job.g.dart';

abstract class Job extends Equatable {
  String get id;
  String get customerName;
  String get address;
  DateTime get scheduledStartTime;
  DateTime get scheduledEndTime;
  JobStatus get status;
  List<dynamic> get tasks;
  bool get requiresKey;
  String? get notes;
  DateTime? get completedAt;
  List<String> get assignedContractors;
  String get assignedTo;
  DateTime get createdAt;

  bool get isCompleted => status == JobStatus.completed;
  bool get isPending => status == JobStatus.pending;
  bool get isInProgress => status == JobStatus.inProgress;
  bool get isCancelled => status == JobStatus.cancelled;
  bool get isDelayed => status == JobStatus.delayed;

  double get completionPercentage {
    if (tasks.isEmpty) return 0;
    final completedTasks = tasks.where((task) => task.completed).length;
    return (completedTasks / tasks.length) * 100;
  }

  Duration get duration => scheduledEndTime.difference(scheduledStartTime);

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        customerName,
        address,
        scheduledStartTime,
        scheduledEndTime,
        status,
        tasks,
        requiresKey,
        notes,
        completedAt,
        assignedContractors,
        assignedTo,
        createdAt,
      ];
}

@HiveType(typeId: 4)
class Payment extends Equatable {
  @HiveField(0)
  final double amount;
  
  @HiveField(1)
  final String status; // pending, completed
  
  @HiveField(2)
  final double hourlyRate;
  
  @HiveField(3)
  final DateTime? paidAt;
  
  @HiveField(4)
  final String? transactionId;

  const Payment({
    required this.amount,
    required this.status,
    required this.hourlyRate,
    this.paidAt,
    this.transactionId,
  });

  bool get isPaid => status == 'completed';

  @override
  List<Object?> get props => [
        amount,
        status,
        hourlyRate,
        paidAt,
        transactionId,
      ];
}

@HiveType(typeId: 5)
class Rating extends Equatable {
  @HiveField(0)
  final int score; // 1-5
  
  @HiveField(1)
  final String? comment;
  
  @HiveField(2)
  final DateTime timestamp;
  
  @HiveField(3)
  final String ratedBy;

  const Rating({
    required this.score,
    required this.timestamp,
    required this.ratedBy,
    this.comment,
  });

  @override
  List<Object?> get props => [
        score,
        comment,
        timestamp,
        ratedBy,
      ];
} 