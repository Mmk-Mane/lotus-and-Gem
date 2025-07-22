import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/theme/widget_themes/appbar_theme.dart';
import 'package:lotusandgems/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:lotusandgems/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:lotusandgems/utils/theme/widget_themes/chip_theme.dart';
import 'package:lotusandgems/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:lotusandgems/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:lotusandgems/utils/theme/widget_themes/text_field_theme.dart';
import 'package:lotusandgems/utils/theme/widget_themes/text_theme.dart';

import '../constants/colors.dart';

class MKAppTheme {
  MKAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: MKColors.grey, // Changed from TColors to MKColors
    brightness: Brightness.light,
    primaryColor: MKColors.primary, // Changed from TColors to MKColors
    textTheme: MKTextTheme.lightTextTheme,
    chipTheme: MKChipTheme.lightChipTheme,
    scaffoldBackgroundColor: MKColors.white, // Changed from TColors to MKColors
    appBarTheme: MKAppBarTheme.lightAppBarTheme,
    checkboxTheme: MKCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: MKBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MKElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MKOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MKTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: MKColors.grey, // Changed from TColors to MKColors
    brightness: Brightness.dark,
    primaryColor: MKColors.primary, // Changed from TColors to MKColors
    textTheme: MKTextTheme.darkTextTheme,
    chipTheme: MKChipTheme.darkChipTheme,
    scaffoldBackgroundColor: MKColors.black, // Changed from TColors to MKColors
    appBarTheme: MKAppBarTheme.darkAppBarTheme,
    checkboxTheme: MKCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: MKBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: MKElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MKOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MKTextFormFieldTheme.darkInputDecorationTheme,
  );
}
