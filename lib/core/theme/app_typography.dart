import 'package:flutter/material.dart';
import 'package:work_bee/core/theme/app_colors.dart';

class AppTypography {
  static const String fontFamily = 'Inter';

  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.text1),
    displayMedium: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.text1),
    displaySmall: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.text1),
    headlineMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.text1),
    headlineSmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.text1),
    bodyLarge: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.text2),
    bodyMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.text2),
    titleMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.text2),
    titleSmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.text2),
    bodySmall: TextStyle(
        fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.text2),
    labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.text1),
    labelSmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.text1),
  );

  static TextTheme darkTextTheme = const TextTheme(
    displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: AppColors.textInverse),
    displayMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: AppColors.textInverse),
    displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppColors.textInverse),
    headlineMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.textInverse),
    headlineSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppColors.textInverse),
    bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.textInverse),
    bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textInverse),
    titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textInverse),
    titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textInverse),
    bodySmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.textInverse),
    labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textInverse),
    labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.textInverse),
  );
}
