import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/core/constants/app_images.dart';
import 'package:quran_app/features/todo_request/priority_sheet/priority_sheet_page.dart';

class AddTodoActionsBar extends StatefulWidget {
  const AddTodoActionsBar({super.key, required this.onDateChange, required this.onPriorityChange});

  final Function(DateTime date) onDateChange;
  final Function(int?) onPriorityChange;

  @override
  State<AddTodoActionsBar> createState() => _AddTodoActionsBarState();
}

class _AddTodoActionsBarState extends State<AddTodoActionsBar> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: SvgPicture.asset(AppSvg.timer),
          onPressed: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 90)),
            );
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if(date != null && time != null) {
              _selectedDate =  DateTime(
              date.year,
              date.month,
              date.day,
              time.hour,
              time.minute,
            );
              widget.onDateChange(_selectedDate!);
            }
          },
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {
          },
          icon: SvgPicture.asset(AppSvg.tag),
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: SvgPicture.asset(AppSvg.flag),
          onPressed: () async {
            final result = await showModalBottomSheet<int?>(
              context: context,
              backgroundColor: AppColors.sheetBackgroundColor,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (context) => const TaskPrioritySheet(),
            );
            widget.onPriorityChange(result);
          },
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppSvg.send),
        ),
      ],
    );
  }
}
