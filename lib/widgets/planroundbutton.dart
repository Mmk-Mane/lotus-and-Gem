import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';

class RoundPlanButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed; // Callback for navigation

  const RoundPlanButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Round Button
        GestureDetector(
          onTap: onPressed, // Trigger navigation on tap
          child: Container(
            padding: const EdgeInsets.all(12), // Adjust for button size
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MKColors.primaryBackground, // Adjust button color
            ),
            child: Icon(
              icon,
              color: MKColors.primary, // Icon color
              size: 35, // Adjust icon size
            ),
          ),
        ),
        const SizedBox(height: 8), // Space between icon and label

        // Button Label
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black),
          textAlign: TextAlign.center,

        ),

      ],
    );
  }
}
