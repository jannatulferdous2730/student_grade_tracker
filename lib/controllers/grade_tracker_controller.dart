import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  GradeTrackerController() {
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    
    final isDark = prefs.getBool('isDarkMode');
    if (isDark != null) {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    }
    
    final subjectsJson = prefs.getString('subjects');
    if (subjectsJson != null) {
      final List<dynamic> decoded = jsonDecode(subjectsJson);
      _subjects.clear();
      _subjects.addAll(decoded.map((item) => Subject.fromJson(item as Map<String, dynamic>)));
    }
    notifyListeners();
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(_subjects.map((s) => s.toJson()).toList());
    await prefs.setString('subjects', encoded);
  }

  Future<void> _saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

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
    _saveTheme();
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
      
      _saveData();
      notifyListeners();
    }
  }

  // Delete Subject Action
  void deleteSubject(int index) {
    if (index >= 0 && index < _subjects.length) {
      _subjects.removeAt(index);
      _saveData();
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
