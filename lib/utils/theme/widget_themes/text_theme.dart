import 'package:flutter/material.dart';
import '../../constants/colors.dart';

/// Custom Class for Light & Dark Text Themes
class MKTextTheme {
  MKTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: MKColors.dark),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: MKColors.dark),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: MKColors.dark),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: MKColors.dark),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: MKColors.dark),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: MKColors.dark),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: MKColors.dark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: MKColors.dark),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: MKColors.dark.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: MKColors.dark),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: MKColors.dark.withOpacity(0.5)),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: MKColors.light),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: MKColors.light),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: MKColors.light),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: MKColors.light),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: MKColors.light),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: MKColors.light),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: MKColors.light),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: MKColors.light),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: MKColors.light.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: MKColors.light),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: MKColors.light.withOpacity(0.5)),
  );
}
