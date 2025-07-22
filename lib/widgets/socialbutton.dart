import 'package:flutter/material.dart';


class SocialImageButton extends StatelessWidget {
  final String assetImagePath;
  final VoidCallback onPressed;

  const SocialImageButton({
    Key? key,
    required this.assetImagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50.0, // Width of the button
        height: 50.0, // Height of the button
        decoration: BoxDecoration(
          color: Colors.transparent, // Use primary color as background
          shape: BoxShape.circle, // Make the container circular
        ),
        child: Center(
          child: Image.asset(
            assetImagePath, // Asset image as button content
            width: 50.0, // Image width (adjust as needed)
            height: 50.0, // Image height (adjust as needed)
          ),
        ),
      ),
    );
  }
}
