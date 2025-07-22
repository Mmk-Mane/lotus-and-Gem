import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';

class MkCircularLoader extends StatelessWidget {
  /// Default constructor for the TCircularLoader.
  ///
  /// Parameters:
  ///   - foregroundColor: The color of the circular loader.
  ///   - backgroundColor: The background color of the circular loader.
  const MkCircularLoader({
    super.key,
    this.foregroundColor = MKColors.white,
    this.backgroundColor = MKColors.primary,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(MKSizes.lg),
      decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle), // Circular background
      child: Center(
        child: CircularProgressIndicator(
            color: foregroundColor,
            backgroundColor: Colors.transparent), // Circular loader
      ),
    );
  }
}
