import 'package:flutter/material.dart';
import 'package:quran_app/core/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isPrimary = true,
    this.hasBackground = true,
    this.height,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isPrimary;
  final double? height;
  final bool hasBackground;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        color: !hasBackground ? null : isPrimary ? AppColors.primaryColor : AppColors.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: !isPrimary ? const BorderSide(color: AppColors.primaryColor, width: 2) : BorderSide.none,
        ),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
