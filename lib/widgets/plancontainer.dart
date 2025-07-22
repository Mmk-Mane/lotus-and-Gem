import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/device_utility.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';

class PlanContainer extends StatelessWidget {
  final String title; // Dynamic title
  final String subtitle; // Dynamic subtitle (e.g., base plan details)
  final String details; // Dynamic plan details
  final VoidCallback onButtonPressed; // Button action callback
  final String backgroundImage; // Background image for the card
  final String badgeImage; // Badge image for the left side

  const PlanContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.details,
    required this.onButtonPressed,
    this.backgroundImage = MKImg.cardbg1, // Default background
    this.badgeImage = MKImg.goldbatch,   // Default badge
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170,
          width: MKDeviceUtils.getScreenWidth(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(backgroundImage), // Dynamic background image
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(badgeImage, height: 150), // Dynamic badge image
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Title (Using ThemeData)
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: MKColors.white,
                      ),
                    ),
                    const SizedBox(height: MKSizes.sm), // Spacing
                    // Subtitle (Using ThemeData)
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MKColors.white.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: MKSizes.sm),
                    // Details (Using ThemeData)
                    Text(
                      details,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: MKColors.white.withOpacity(0.8),
                      ),
                    ),

                    const Spacer(), // Pushes the button to the bottom
                    // Button
                    Align(
                      alignment: Alignment.bottomRight,
                      child: OutlinedButton(
                        onPressed: onButtonPressed,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: MKColors.white,
                          side: const BorderSide(color: MKColors.borderPrimary),
                          padding: const EdgeInsets.symmetric(
                            vertical: MKSizes.buttonHeight - 10,
                            horizontal: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(MKSizes.buttonRadius),
                          ),
                        ),
                        child: const Text("More Details"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
