import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class MKElevatedButtonTheme {
  MKElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: MKColors.light,
      backgroundColor: MKColors.primary,
      disabledForegroundColor: MKColors.darkGrey,
      disabledBackgroundColor: MKColors.buttonDisabled,
      side: const BorderSide(color: MKColors.primary),
      padding: const EdgeInsets.symmetric(vertical: MKSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: MKColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MKSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: MKColors.light,
      backgroundColor: MKColors.primary,
      disabledForegroundColor: MKColors.darkGrey,
      disabledBackgroundColor: MKColors.darkerGrey,
      side: const BorderSide(color: MKColors.primary),
      padding: const EdgeInsets.symmetric(vertical: MKSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: MKColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MKSizes.buttonRadius)),
    ),
  );
}
