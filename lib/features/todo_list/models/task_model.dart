import 'package:quran_app/features/todo_list/models/task_category.dart';

class Task {
  final int? id;
  final String title;
  final String description;
  final DateTime taskTime;
  final int priority;
  final bool isFinished;
  // final TaskCategory category;
  // final List<Task> subtasks;

  const Task({
    this.id,
    required this.title,
    required this.description,
    required this.taskTime,
    // required this.category,
    required this.priority,
    this.isFinished = false,
    // required this.subtasks,
  });


  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      taskTime: DateTime.tryParse(map["taskTime"] as String) ?? DateTime.now(),
      priority: map["priority"],
    );
  }

  Map<String, dynamic> toMap() => {
    // "id" : id,
    "title" : title,
    "description" : description,
    "taskTime" : taskTime.toIso8601String(),
    "priority" : priority,
  };

  @override
  String toString() {
    return "Task($id, $title, $description, $taskTime, $priority)";
  }
}
