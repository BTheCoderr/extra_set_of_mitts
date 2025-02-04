import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final Function(bool) onCompleted;

  const TaskListItem({
    Key? key,
    required this.task,
    required this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        leading: Checkbox(
          value: task.completed,
          onChanged: (value) {
            if (value != null) {
              onCompleted(value);
            }
          },
        ),
        title: Text(
          task.name,
          style: TextStyle(
            decoration: task.completed ? TextDecoration.lineThrough : null,
            color: task.completed ? Colors.grey : null,
          ),
        ),
        subtitle: task.notes != null && task.notes!.isNotEmpty
            ? Text(
                task.notes!,
                style: TextStyle(
                  decoration: task.completed ? TextDecoration.lineThrough : null,
                  color: task.completed ? Colors.grey : null,
                ),
              )
            : null,
        trailing: task.completed
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : null,
      ),
    );
  }
} 