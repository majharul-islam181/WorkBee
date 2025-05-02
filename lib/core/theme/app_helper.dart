import 'package:flutter/material.dart';
import 'package:work_bee/core/theme/app_colors.dart';

extension AppColorExtension on BuildContext {
  Color get borderColor =>
      Theme.of(this).brightness == Brightness.light
          ? AppColors.borderLight
          : AppColors.borderDark;
  Color get backgroundColor => 
      Theme.of(this).brightness == Brightness.light
          ? AppColors.primaryLight
          : Colors.black;
}
