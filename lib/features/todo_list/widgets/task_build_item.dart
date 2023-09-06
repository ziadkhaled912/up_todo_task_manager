import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/core/constants/app_images.dart';
import 'package:quran_app/features/todo_list/models/task_model.dart';

class TaskBuildItem extends StatelessWidget {
  const TaskBuildItem({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.sheetBackgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          children: [
            Checkbox(
              value: task.isFinished,
              shape: CircleBorder(
                side: BorderSide(color: AppColors.textColor),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    DateFormat.yMMMd().add_jm().format(task.taskTime),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.primaryColor, width: 1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppSvg.flag,
                      width: 14,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      task.priority.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
