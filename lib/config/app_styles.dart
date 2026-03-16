import 'package:flutter/material.dart';

class AppStyling {
  // ✅ Private constructor — prevents creating instances
  AppStyling._();

  // Primary
  static const Color primary = Color(0xFF6C3483); // Purple
  static const Color primaryLight = Color(0xFF9B59B6);
  static const Color primaryDark = Color(0xFF4A235A);

  // Background
  static const Color background = Color(0xFF292929);
  static const Color surface = Color(0xFF606060);

  // Text
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFFFFFFF);

  // Status
  static const Color success = Color(0xFF27AE60);
  static const Color error = Color(0xFFE74C3C);
  static const Color warning = Color(0xFFF39C12);

  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textSecondary,
  );

  static const TextStyle caption = TextStyle(fontSize: 12, color: textHint);

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textHint,
  );

  // Padding
  static const double paddingXS = 4.0;
  static const double paddingSM = 8.0;
  static const double paddingMD = 16.0;
  static const double paddingLG = 24.0;
  static const double paddingXL = 32.0;

  // Border Radius
  static const double radiusSM = 4.0;
  static const double radiusMD = 8.0;
  static const double radiusLG = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusFull = 100.0;

  // Icon Sizes
  static const double iconSM = 16.0;
  static const double iconMD = 24.0;
  static const double iconLG = 32.0;

  // Font Sizes
  static const double fontSM = 12.0;
  static const double fontMD = 16.0;
  static const double fontLG = 20.0;
  static const double fontXL = 24.0;
}
