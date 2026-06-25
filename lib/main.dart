import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/grade_tracker_controller.dart';
import 'themes/app_theme.dart';
import 'views/main_navigation_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GradeTrackerController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the controller to listen to theme changes in real time
    final controller = context.watch<GradeTrackerController>();

    return MaterialApp(
      title: 'Student Grade Tracker',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: controller.themeMode,
      home: const MainNavigationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
