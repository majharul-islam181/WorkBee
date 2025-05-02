import 'package:flutter/material.dart';
import 'package:work_bee/core/theme/app_colors.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Widget buildTimeRow(String startTime, String endTime,
      {bool editable = false,
      bool locked = false,
      required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Text(
            startTime,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: locked ? AppColors.text2 : Colors.white,
                ),
          ),
          const Spacer(),
          Text(
            endTime,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: locked ? AppColors.text2 : Colors.white,
                ),
          ),
          const SizedBox(width: 8),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color:
                    locked ? AppColors.text2 : AppColors.text2.withOpacity(0.6),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                locked
                    ? Icons.lock_outline
                    : editable
                        ? Icons.edit
                        : Icons.lock_outline,
                size: 18,
                color: locked ? AppColors.text2 : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ));
  }

  Widget buildViewAllButton(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: const BorderSide(color: AppColors.text2),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          child: Text(
            "View all",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.text2),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, size: 40), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: "Notifications"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 24),

              // Submitted availability
              buildSectionTitle("Submitted availability", context),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.text2.withOpacity(0.6)),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Today",
                            style: Theme.of(context).textTheme.headlineMedium),
                        const Spacer(),
                        Row(
                          children: [
                            Text("Submitted: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.text2)),
                            Text("09 hrs",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        color: AppColors.text2, fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    buildTimeRow("09:30 AM", "06:30 PM",
                        editable: true, locked: true, context: context),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey.shade200
                      : AppColors.surfacePlain,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.text2),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Sep 22, 2024"),
                        const Spacer(),
                        const Text("Locked",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Text("Submitted: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.text2)),
                            Text("09 hrs",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        color: AppColors.text2, fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    buildTimeRow("09:30 AM", "12:30 PM",
                        locked: true, context: context),
                  ],
                ),
              ),
              buildViewAllButton(context),

              const SizedBox(height: 24),

              // Assigned by admin
              buildSectionTitle("Assigned by admin", context),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text("Today",
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        Spacer(),
                        Text("Assigned: 04 hrs",
                            style: TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    buildTimeRow("11:30 AM", "03:30 PM",
                        locked: true, context: context),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Note: Do not come without uniform.",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.text2,
                                  )),
                    ),
                    const SizedBox(height: 8),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text("Sep 22, 2024"),
                              Spacer(),
                              Text("Assigned: 07 hrs",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          buildTimeRow("09:30 AM", "12:30 PM",
                              locked: true, context: context),
                          const SizedBox(height: 8),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Note: Come a little early.",
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                    buildViewAllButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
