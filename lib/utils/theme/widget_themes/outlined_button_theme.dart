import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class MKOutlinedButtonTheme {
  MKOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: MKColors.dark,
      side: const BorderSide(color: MKColors.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 15, color: MKColors.black, fontWeight: FontWeight.w400),
      padding: const EdgeInsets.symmetric(
          vertical: MKSizes.buttonHeight, horizontal: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MKSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: MKColors.light,
      side: const BorderSide(color: MKColors.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 15, color: MKColors.textWhite, fontWeight: FontWeight.w400),
      padding: const EdgeInsets.symmetric(
          vertical: MKSizes.buttonHeight, horizontal: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MKSizes.buttonRadius)),
    ),
  );
}
