import 'package:flutter/material.dart';

class AppTheme {
  // Midnight Navy Slate & Sunset Coral-Pink Color Palette

  // Light Mode Colors
  static const Color _lightPrimary = Color(0xFF1E293B);      // Deep Slate Navy
  static const Color _lightSecondary = Color(0xFFF43F5E);    // Sunset Rose/Coral
  static const Color _lightBackground = Color(0xFFF8FAFC);   // Very Soft Slate-White
  static const Color _lightSurface = Color(0xFFFFFFFF);      // Clean White
  static const Color _lightError = Color(0xFFE11D48);        // Rose Red
  static const Color _lightTextPrimary = Color(0xFF0F172A);  // Deep Dark Slate
  static const Color _lightTextSecondary = Color(0xFF475569); // Muted Slate

  // Dark Mode Colors
  static const Color _darkPrimary = Color(0xFFE2E8F0);        // Light Slate/Off-white
  static const Color _darkSecondary = Color(0xFFFB7185);      // Neon Sunset Pink-Coral
  static const Color _darkBackground = Color(0xFF0B0F19);     // Obsidian Slate Black
  static const Color _darkSurface = Color(0xFF1E293B);        // Deep Slate Card
  static const Color _darkError = Color(0xFFFDA4AF);          // Soft Coral Red
  static const Color _darkTextPrimary = Color(0xFFF8FAFC);    // White/Slate
  static const Color _darkTextSecondary = Color(0xFF94A3B8);  // Muted Cool Gray

  // Custom Light ThemeData
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: _lightPrimary,
      scaffoldBackgroundColor: _lightBackground,
      colorScheme: const ColorScheme.light(
        primary: _lightPrimary,
        secondary: _lightSecondary,
        surface: _lightSurface,
        error: _lightError,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: _lightTextPrimary,
        onError: Colors.white,
        surfaceContainerHighest: Color(0xFFF1F5F9), // Card highlights
        onSurfaceVariant: _lightTextSecondary,
        outline: Color(0xFFE2E8F0),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: _lightTextPrimary),
        titleTextStyle: TextStyle(
          color: _lightTextPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _lightSurface,
        selectedItemColor: _lightSecondary,
        unselectedItemColor: _lightTextSecondary,
        selectedIconTheme: IconThemeData(size: 26),
        unselectedIconTheme: IconThemeData(size: 22),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
        type: BottomNavigationBarType.fixed,
        elevation: 10,
      ),
      cardTheme: CardThemeData(
        color: _lightSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFFF1F5F9), width: 1.5),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF1F5F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: _lightSecondary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: _lightError, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: _lightError, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: const TextStyle(color: _lightTextSecondary, fontSize: 14),
        labelStyle: const TextStyle(color: _lightTextPrimary, fontSize: 14, fontWeight: FontWeight.w500),
        errorStyle: const TextStyle(color: _lightError, fontWeight: FontWeight.w600),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _lightSecondary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: _lightTextPrimary, letterSpacing: -1.0),
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: _lightTextPrimary, letterSpacing: -0.5),
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: _lightTextPrimary),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: _lightTextPrimary),
        bodyLarge: TextStyle(fontSize: 16, color: _lightTextPrimary, height: 1.5),
        bodyMedium: TextStyle(fontSize: 14, color: _lightTextSecondary, height: 1.4),
        labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: _lightSecondary),
      ),
    );
  }

  // Custom Dark ThemeData
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: _darkPrimary,
      scaffoldBackgroundColor: _darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimary,
        secondary: _darkSecondary,
        surface: _darkSurface,
        error: _darkError,
        onPrimary: _darkBackground,
        onSecondary: _darkBackground,
        onSurface: _darkTextPrimary,
        onError: _darkBackground,
        surfaceContainerHigh: Color(0xFF0F172A), // Inside card highlights
        onSurfaceVariant: _darkTextSecondary,
        outline: Color(0xFF334155),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: _darkTextPrimary),
        titleTextStyle: TextStyle(
          color: _darkTextPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _darkSurface,
        selectedItemColor: _darkSecondary,
        unselectedItemColor: _darkTextSecondary,
        selectedIconTheme: IconThemeData(size: 26),
        unselectedIconTheme: IconThemeData(size: 22),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
        type: BottomNavigationBarType.fixed,
        elevation: 10,
      ),
      cardTheme: CardThemeData(
        color: _darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFF334155), width: 1.5),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF0F172A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: _darkSecondary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: _darkError, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: _darkError, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: const TextStyle(color: _darkTextSecondary, fontSize: 14),
        labelStyle: const TextStyle(color: _darkTextPrimary, fontSize: 14, fontWeight: FontWeight.w500),
        errorStyle: const TextStyle(color: _darkError, fontWeight: FontWeight.w600),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _darkSecondary,
          foregroundColor: _darkBackground,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: _darkTextPrimary, letterSpacing: -1.0),
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: _darkTextPrimary, letterSpacing: -0.5),
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: _darkTextPrimary),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: _darkTextPrimary),
        bodyLarge: TextStyle(fontSize: 16, color: _darkTextPrimary, height: 1.5),
        bodyMedium: TextStyle(fontSize: 14, color: _darkTextSecondary, height: 1.4),
        labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: _darkSecondary),
      ),
    );
  }
}
