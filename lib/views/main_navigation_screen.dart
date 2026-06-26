import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/grade_tracker_controller.dart';
import 'add_subject_screen.dart';
import 'subject_list_screen.dart';
import 'summary_screen.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch the controller for index and theme updates
    final controller = context.watch<GradeTrackerController>();
    final theme = Theme.of(context);

    // Dynamic titles based on active tab
    final titles = [
      'Add Subject',
      'Subject List',
      'Result Summary',
    ];

    // List of screens
    final screens = const [
      AddSubjectScreen(),
      SubjectListScreen(),
      SummaryScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[controller.currentTabIndex],
          style: theme.appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: controller.toggleTheme,
            icon: Icon(
              controller.isDarkMode
                  ? Icons.wb_sunny_rounded
                  : Icons.nightlight_round,
              color: theme.colorScheme.onSurface,
            ),
            tooltip: controller.isDarkMode ? 'Light Mode' : 'Dark Mode',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: controller.currentTabIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.06),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: controller.currentTabIndex,
          onTap: controller.setTabIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_rounded),
              activeIcon: Icon(Icons.add_circle_rounded),
              label: 'Add Subject',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_rounded),
              activeIcon: Icon(Icons.view_list_rounded),
              label: 'Subjects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.query_stats_rounded),
              activeIcon: Icon(Icons.analytics_rounded),
              label: 'Summary',
            ),
          ],
        ),
      ),
    );
  }
}
