import 'package:flutter/material.dart';

class NexaboundTheme {
  static const background = Color(0xFF100E17);
  static const surface = Color(0xFF1B1826);
  static const card = Color(0xFF262235);
  static const amber = Color(0xFFF59E0B);
  static const gold = Color(0xFFFBBF24);
  static const crimson = Color(0xFFE11D48);
  static const textPrimary = Color(0xFFFAF5FF);
  static const textSecondary = Color(0xFFA8A29E);

  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: amber,
      cardColor: card,
      fontFamily: 'AppFont',
      colorScheme: const ColorScheme.dark(
        primary: amber,
        secondary: gold,
        surface: surface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
