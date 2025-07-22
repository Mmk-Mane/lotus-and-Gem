import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50), // Width = double.infinity and height = 50
        textStyle: Theme.of(context).textTheme.headlineSmall, // Use the button text style from theme
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
