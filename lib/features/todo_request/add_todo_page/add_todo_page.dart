import 'package:flutter/material.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/features/todo_request/add_todo_page/widgets/add_todo_actions_bar.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
          SizedBox(height: 14),
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: "Title",
              enabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.borderColor, width: 1)),
              hintStyle: TextStyle(
                fontSize: 18,
                color: AppColors.greyColor,
              )
            ),
          ),
          const SizedBox(height: 14),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(
              hintText: "Description",
              // border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.borderColor)),
              enabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.borderColor, width: 1)),
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: AppColors.greyColor,
                )
            ),
          ),
          const SizedBox(height: 14),
          AddTodoActionsBar(
            onDateChange: (date) {
              print("SelectedDate $date");
            },
            onPriorityChange: (priority) {
              print("SelectedPriority is $priority");
            },
          ),
        ],
      ),
    );
  }
}
