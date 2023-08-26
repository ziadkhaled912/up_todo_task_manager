import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/core/constants/theme_constants.dart';

class AppTheme {
  static ValueNotifier<Locale> currentLocale =
      ValueNotifier(ThemeConstants.englishLocale);

  static ThemeData lightTheme() => ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        fontFamily: ThemeConstants.latoFontFamily,
        inputDecorationTheme: const InputDecorationTheme(
            errorStyle: TextStyle(fontSize: 14, color: Colors.red)),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          labelSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
}
