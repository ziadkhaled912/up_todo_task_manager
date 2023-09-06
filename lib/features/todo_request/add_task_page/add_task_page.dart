import 'package:flutter/material.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/features/todo_list/models/task_model.dart';
import 'package:quran_app/features/todo_request/add_task_page/widgets/add_todo_actions_bar.dart';
import 'package:quran_app/features/todo_request/data/task_repository.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TaskRepository _taskRepository = TaskRepository();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _selectedTaskDate;
  int? _selectedPriority;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add Task",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(.87),
            ),
          ),
          const SizedBox(height: 14),
          TextFormField(
            controller: _titleController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                hintText: "Title",
                enabledBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.borderColor, width: 1)),
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: AppColors.greyColor,
                )),
          ),
          const SizedBox(height: 14),
          TextFormField(
            controller: _descriptionController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                hintText: "Description",
                // border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.borderColor)),
                enabledBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.borderColor, width: 1)),
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: AppColors.greyColor,
                )),
          ),
          const SizedBox(height: 14),
          AddTodoActionsBar(
            onDateChange: (date) {
              print("SelectedDate $date");
              _selectedTaskDate = date;
            },
            onPriorityChange: (priority) {
              print("SelectedPriority $priority");
              _selectedPriority = priority;
            },
            onSend: () async {
              if (_selectedTaskDate != null && _selectedPriority != null) {
                final Task task = Task(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  taskTime: _selectedTaskDate!,
                  priority: _selectedPriority!,
                );
                final result = await _taskRepository.insertTask(task);
                if(result) {
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error while adding new task")));
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
