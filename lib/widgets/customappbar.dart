import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart'; // Assuming MKColors is defined here

import 'package:lotusandgems/utils/constants/sizes.dart'; // Assuming MKImg is defined here

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? logoAssetPath;  // Path to the logo asset
  final List<Widget>? actions;  // Optional actions (icons/buttons)
  final double appBarHeight;
  // Constructor to initialize logoAssetPath and actions (optional)
  const CustomAppBar({
    super.key,
    this.logoAssetPath,  // Logo path, this can be null
    this.actions,
    this.appBarHeight = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: logoAssetPath != null
          ? Image.asset(
        logoAssetPath!,
        height: 30,
        color: MKColors.primary,// Adjust the height as per your design
        fit: BoxFit.contain,  // To maintain aspect ratio
      )
          : Text("GOM", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: MKColors.primary),), // If no logo is passed, title will be null
      backgroundColor: MKColors.white, // Background color for the app bar
      elevation: 2,
      centerTitle: true,// No shadow
      actions: actions, // Add actions if provided
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(MKSizes.appBarHeight); // AppBar height
}
