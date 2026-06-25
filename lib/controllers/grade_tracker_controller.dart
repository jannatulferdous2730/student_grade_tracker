import 'package:flutter/material.dart';
import '../models/subject.dart';

class GradeTrackerController extends ChangeNotifier {
  // Subjects List
  final List<Subject> _subjects = [];

  // Navigation State
  int _currentTabIndex = 0;

  // Theme State
  ThemeMode _themeMode = ThemeMode.light;

  // Form State and Controllers managed in Controller (MVC)
  final nameController = TextEditingController();
  final markController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Getters
  List<Subject> get subjects => List.unmodifiable(_subjects);
  int get currentTabIndex => _currentTabIndex;
  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  // Set Navigation Tab
  void setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  // Toggle Theme Mode
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // Add Subject Action
  void addSubject() {
    if (formKey.currentState?.validate() ?? false) {
      final name = nameController.text.trim();
      final mark = int.parse(markController.text.trim());

      _subjects.add(Subject(name: name, mark: mark));
      
      // Clear form after successful addition
      nameController.clear();
      markController.clear();
      
      notifyListeners();
    }
  }

  // Delete Subject Action
  void deleteSubject(int index) {
    if (index >= 0 && index < _subjects.length) {
      _subjects.removeAt(index);
      notifyListeners();
    }
  }

  // Live Calculations (Updating in real time)
  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) return 0.0;
    final totalMarks = _subjects.fold<int>(0, (sum, item) => sum + item.mark);
    return totalMarks / _subjects.length;
  }

  String get overallGrade {
    if (_subjects.isEmpty) return 'N/A';
    final avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

  // Utilizing .where() to filter passing subjects (Grade is A, B, or C)
  List<Subject> get passingSubjects {
    return _subjects.where((subject) => subject.grade != 'F').toList();
  }

  // Utilizing .where() to filter failing subjects (Grade is F)
  List<Subject> get failingSubjects {
    return _subjects.where((subject) => subject.grade == 'F').toList();
  }

  // Utilizing .map() to extract all grades
  List<String> get allGrades {
    return _subjects.map((subject) => subject.grade).toList();
  }

  // Clean-up controllers when disposed
  @override
  void dispose() {
    nameController.dispose();
    markController.dispose();
    super.dispose();
  }
}
