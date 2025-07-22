import 'package:flutter/material.dart';

class MKColors {
  // App theme colors
  static const Color primary = Color(0xFF50C878); // Emerald Green
  static const Color secondary = Color(0xFFFFE24B); // Gold Yellow
  static const Color accent = Color(0xFFA8D5BA); // Light Green Accent

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF6F6F6); // Light background
  static const Color dark = Color(0xFF272727); // Dark background
  static const Color primaryBackground =
      Color(0xFFEAF8F1); // Light Emerald Green tint

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = MKColors.white.withOpacity(0.1);

  // Button colors
  static const Color buttonPrimary =
      Color(0xFF50C878); // Emerald Green for buttons
  static const Color buttonSecondary = Color(0xFF6C757D); // Secondary buttons
  static const Color buttonDisabled = Color(0xFFC4C4C4); // Disabled buttons

  // Border colors
  static const Color borderPrimary = Color(0xFF50C878); // Emerald Green borders
  static const Color borderSecondary =
      Color(0xFFE6E6E6); // Neutral secondary borders

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F); // Error Red
  static const Color success = Color(0xFF388E3C); // Success Green
  static const Color warning = Color(0xFFF57C00); // Warning Orange
  static const Color info = Color(0xFF1976D2); // Info Blue

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  // New Bottom Navigation Colors
  static const Color bottomBarBackground = Color(0xFFDFF5EB); // Soft Mint Green
  static const Color bottomBarSelected = Color(0xFF20B2AA); // Bright Teal
  static const Color bottomBarUnselected = Color(0xFF9A9A9A); // Muted Stone Grey
  static const Color bottomBarIndicator = Color(0xFFFFC857); // Golden Glow
}
