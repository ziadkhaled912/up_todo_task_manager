import 'package:flutter/material.dart';
import 'package:quran_app/features/todo_list/models/task_model.dart';
import 'package:quran_app/features/todo_list/widgets/task_build_item.dart';
import 'package:quran_app/features/todo_list/widgets/tasks_empty_widget.dart';
import 'package:quran_app/features/todo_request/data/task_repository.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TaskRepository _taskRepository = TaskRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _taskRepository.getAllTasks(),
      builder: (context, data) {
        if(data.hasData) {
          if (data.data!.isEmpty) {
            return const Center(child: TasksEmptyWidget());
          }
          return ListView.separated(
            itemCount: data.data!.length,
            padding: const EdgeInsets.all( 16),
            separatorBuilder: (_, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => TaskBuildItem(
              task: data.data![index],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
