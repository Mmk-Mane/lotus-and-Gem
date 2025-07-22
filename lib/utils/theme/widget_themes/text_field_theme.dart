import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';

class MKTextFormFieldTheme {
  MKTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: MKColors.darkGrey,
    suffixIconColor: MKColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: MKSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: MKSizes.fontSizeMd, color: MKColors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: MKSizes.fontSizeSm, color: MKColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: MKColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MKSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MKColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MKSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MKColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MKSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MKColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MKSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MKColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MKSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: MKColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: MKColors.darkGrey,
    suffixIconColor: MKColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: MKSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: MKSizes.fontSizeMd, color: MKColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: MKSizes.fontSizeSm, color: MKColors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: MKColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MKSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MKColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MKSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MKColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MKSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MKColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MKSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MKColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MKSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: MKColors.warning),
    ),
  );
}
