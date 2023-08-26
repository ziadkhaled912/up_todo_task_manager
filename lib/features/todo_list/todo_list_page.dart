import 'package:flutter/material.dart';
import 'package:quran_app/features/todo_list/models/todo_model.dart';
import 'package:quran_app/features/todo_list/widgets/task_build_item.dart';
import 'package:quran_app/features/todo_list/widgets/tasks_empty_widget.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<Task> _tasksList = [];

  @override
  Widget build(BuildContext context) {
    if (_tasksList.isEmpty) {
      return const Center(child: TasksEmptyWidget());
    }
    return ListView.builder(
      itemCount: _tasksList.length,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemBuilder: (context, index) => const TaskBuildItem(),
    );
  }
}
