import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/core/constants/app_images.dart';
import 'package:quran_app/core/widgets/app_button.dart';

class TaskPrioritySheet extends StatefulWidget {
  const TaskPrioritySheet({super.key});

  @override
  State<TaskPrioritySheet> createState() => _TaskPrioritySheetState();
}

class _TaskPrioritySheetState extends State<TaskPrioritySheet> {
  int? _selectedPriority;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Task Priority",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(.87),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey),
            const SizedBox(height: 22),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16),
              itemBuilder: (context, index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: _selectedPriority == (index+1)
                      ? AppColors.primaryColor
                      : AppColors.cardBGColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedPriority = index + 1;
                    });
                  },
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AppSvg.flag),
                        const SizedBox(height: 5),
                        Text("${index + 1}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(.87),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    title: "Cancel",
                    height: 48,
                    hasBackground: false,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: AppButton(
                    title: "Save",
                    height: 48,
                    onPressed: () {
                      Navigator.pop(context, _selectedPriority);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
