import 'package:quran_app/features/todo_list/models/task_category.dart';

class Task {
  final String title;
  final String description;
  final DateTime taskTime;
  final TaskCategory category;
  final int priority;
  final List<Task> subtasks;

  const Task({
    required this.title,
    required this.description,
    required this.taskTime,
    required this.category,
    required this.priority,
    required this.subtasks,
  });
}