import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/core/constants/app_images.dart';

class TasksEmptyWidget extends StatelessWidget {
  const TasksEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppSvg.tasksEmpty,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
        const SizedBox(height: 10),
        Text(
          "What do you want to do today?",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(.87),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Tap + to add your tasks",
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Colors.white.withOpacity(.87),
          ),
        ),
      ],
    );
  }
}
