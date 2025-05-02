import 'package:flutter/material.dart';
import 'package:work_bee/core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Using TextTheme
            Text(
              'Display Large Text',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Body Medium Text',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Label Small Text',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Divider(
              color: Theme.of(context)
                  .dividerColor, // Automatically light/dark handled
              thickness: 1,
            ),

            Container(
              width: double.infinity,
              height: 100,
              color: AppColors.primaryMain, // Use any color from AppColors
              child: const Center(
                child: Text(
                  "Primary Background",
                  style: TextStyle(color: AppColors.textInverse),
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              padding: const EdgeInsets.all(20),
              child: const Text('Border example'),
            ),
          ],
        ),
      ),
    );
  }
}
