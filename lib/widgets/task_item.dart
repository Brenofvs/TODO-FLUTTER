import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        task.completed ? Icons.check_circle : Icons.radio_button_unchecked,
        color: task.completed ? Colors.green : Colors.blue,
      ),
      title: Text(task.name),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
      onTap: () => onChanged(!task.completed),
    );
  }
}
