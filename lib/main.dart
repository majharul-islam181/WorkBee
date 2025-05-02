import 'package:flutter/material.dart';
import 'package:work_bee/core/theme/app_theme.dart';
import 'package:work_bee/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theming Example',
      theme: AppTheme.lightTheme, // Light Theme
      darkTheme: AppTheme.darkTheme, // Dark Theme
      themeMode: ThemeMode.system, // Automatically switches based on system setting
      home: const HomePage(),
    );
  }
}
