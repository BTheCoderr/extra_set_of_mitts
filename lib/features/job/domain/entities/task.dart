import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends Equatable {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final String? notes;
  
  @HiveField(3)
  final bool completed;
  
  @HiveField(4)
  final DateTime? completedAt;
  
  @HiveField(5)
  final String? completedBy;
  
  @HiveField(6)
  final int order;

  const Task({
    required this.id,
    required this.name,
    this.notes,
    this.completed = false,
    this.completedAt,
    this.completedBy,
    this.order = 0,
  });

  Task copyWith({
    String? id,
    String? name,
    String? notes,
    bool? completed,
    DateTime? completedAt,
    String? completedBy,
    int? order,
  }) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      completed: completed ?? this.completed,
      completedAt: completedAt ?? this.completedAt,
      completedBy: completedBy ?? this.completedBy,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        notes,
        completed,
        completedAt,
        completedBy,
        order,
      ];
} 