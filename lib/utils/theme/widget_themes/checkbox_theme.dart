import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';

/// Custom Class for Light & Dark Text Themes
class MKCheckboxTheme {
  MKCheckboxTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(MKSizes.xs)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return MKColors.white;
      } else {
        return MKColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return MKColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /// Customizable Dark Text Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(MKSizes.xs)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return MKColors.white;
      } else {
        return MKColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return MKColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
