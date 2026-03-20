import 'package:flutter/material.dart';

class BookColors {
  BookColors._(); // Private constructor to prevent instantiation

  //App Basic Colors
  static const Color primary = Color(0xFF6C63FF);
  static const Color secondary = Color(0xFFFF6584);
  static const Color accent = Color(0xFFFF6584);

  //Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    colors: [
      Color(0xFF6C63FF),
      Color(0xFFFF6584),
      Color.fromARGB(255, 184, 53, 79),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  //Text Colors
  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF555555);
  static const Color textWhite = Color(0xFF666666);

  //Background Colors
  static const Color light = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFFEEEEEE);
  static const Color primaryBackground = Color(0xFFEEEEEE);

  //Background Container Colors
  static const Color lightContainer = Color(0xFFFFFFFF);
  static const Color darkContainer = Color(0xFFEEEEEE);

  //Button Colors
  static const Color buttonPrimary = Color(0xFF6C63FF);
  static const Color buttonSecondary = Color(0xFFFF6584);
  static const Color buttonDisabled = Color(0xFFFF6584);

  //Border Colors
  static const Color borderPrimary = Color(0xFFEEEEEE);
  static const Color borderSecondary = Color(0xFFCCCCCC);

  // Error and Validation Colors
  static const Color error = Color(0xFFFF0000);
  static const Color success = Color(0xFF00FF00);
  static const Color warning = Color(0xFFFFA500);
  static const Color info = Color(0xFF2196F3);

  // Neutral Shades
  static const Color black = Color(0xFFF5F5F5);
  static const Color darkerGrey = Color(0xFFCCCCCC);
  static const Color darkGrey = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFFFFFFF);
  static const Color softGrey = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);
}
