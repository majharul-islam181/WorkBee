import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryMain,
    scaffoldBackgroundColor: AppColors.surfaceMainBG,
    textTheme: AppTypography.lightTextTheme,

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfacePlain,
      iconTheme: const IconThemeData(color: AppColors.text1),
      titleTextStyle: AppTypography.lightTextTheme.headlineMedium,
    ),

    // ColorScheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryMain,
      surface: AppColors.surfaceMainBG,
      error: AppColors.error1,
    ),

    // Border color (divider color for universal border)
    dividerColor: AppColors.borderLight,

    // Optional: Input field border color
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryMain),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryMain,
    scaffoldBackgroundColor: AppColors.text1,
    textTheme: AppTypography.darkTextTheme,

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.text1,
      iconTheme: const IconThemeData(color: AppColors.textInverse),
      titleTextStyle: AppTypography.darkTextTheme.headlineMedium,
    ),

    // ColorScheme
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryMain,
      surface: AppColors.text1,
      error: AppColors.error1,
    ),

    // Border color (divider color for universal border)
    dividerColor: AppColors.borderDark,

    // Optional: Input field border color
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryMain),
      ),
    ),
  );
}
