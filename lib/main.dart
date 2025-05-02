import 'package:flutter/material.dart';
import 'package:work_bee/core/theme/app_theme.dart';
// import 'package:work_bee/home.dart';
import 'package:work_bee/views/login/login_page.dart';
import 'package:work_bee/views/sign_page/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theming Example',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      // home: const HomePage(),
      // home: const LoginPage(),
      home: const SignUpPage(),
    );
  }
}
