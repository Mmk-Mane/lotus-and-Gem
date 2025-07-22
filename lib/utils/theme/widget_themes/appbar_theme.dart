import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';

import '../../constants/colors.dart';

class MKAppBarTheme {
  MKAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: MKColors.black, size: MKSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: MKColors.black, size: MKSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: MKColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: MKColors.black, size: MKSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: MKColors.white, size: MKSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: MKColors.white),
  );
}
