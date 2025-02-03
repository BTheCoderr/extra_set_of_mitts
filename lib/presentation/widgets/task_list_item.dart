import 'package:flutter/material.dart';
import '../../data/models/job.dart';

class TaskListItem extends StatelessWidget {
  final CleaningTask task;
  final Function(bool) onCompleted;

  const TaskListItem({
    Key? key,
    required this.task,
    required this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) => onCompleted(value ?? false),
        ),
        title: Text(
          task.name,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: task.notes != null ? Text(task.notes!) : null,
        trailing: task.photoUrls != null && task.photoUrls!.isNotEmpty
            ? const Icon(Icons.photo_library)
            : null,
      ),
    );
  }
} 