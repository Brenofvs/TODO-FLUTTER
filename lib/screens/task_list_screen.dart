import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../services/firestore_service.dart';
import '../widgets/task_item.dart';
import '../widgets/custom_button.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  final DateTime date;
  const TaskListScreen({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final firestore = context.read<FirestoreService>();
    return Scaffold(
      appBar: AppBar(title: Text('Tarefas - ${date.toIso8601String().split('T')[0]}')),
      body: StreamBuilder<List<Task>>(
        stream: firestore.streamTasks(date),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final tasks = snapshot.data ?? [];
          if (tasks.isEmpty) {
            return const Center(child: Text('Nenhuma tarefa'));
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskItem(
                task: task,
                onChanged: (value) {
                  firestore.updateStatus(task.id, value ?? false);
                },
                onDelete: () => firestore.deleteTask(task.id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTaskScreen(date: date),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
