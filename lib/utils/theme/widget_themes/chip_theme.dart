import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';

class MKChipTheme {
  MKChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: MKColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: MKColors.black),
    selectedColor: MKColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: MKColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: MKColors.darkerGrey,
    labelStyle: TextStyle(color: MKColors.white),
    selectedColor: MKColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: MKColors.white,
  );
}
