import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';
import 'package:ionicons/ionicons.dart';
import 'dart:ui'; // For the BackdropFilter

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      elevation: 0,
      child: Container(
        color: Colors.transparent, // Transparent background for the drawer
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer Header with frosted glass effect
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), // Blur effect for glassy look
                        child: Container(
                          color: Colors.white.withOpacity(0.2), // Light frosted white background
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Flexible(
                          child: Center(
                            child: Image.asset(
                              MKImg.lgLogo,
                              fit: BoxFit.fill,
                              height: 120,
                            ),
                          ),
                        ),
                        const SizedBox(height: MKSizes.defaultSpace),
                        Text(
                          'Divine Craft, Honest Design',
                          style: textTheme.headlineSmall?.copyWith(
                            color: Colors.white, // White text to stand out
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Divider(
                thickness: 2.0,
                height: MKSizes.dividerHeight,
                color: Colors.white, // Divider color adjusted to white
              ),
            ),
            // Drawer items with Ionicons and updated colors
            buildDrawerItem(context, Ionicons.business_outline, 'About us', () {
              Navigator.pop(context); // Close the drawer
            }),
            buildDrawerItem(context, Ionicons.shield_checkmark_outline, 'Privacy Policy', () {
              Navigator.pop(context);
            }),
            buildDrawerItem(context, Ionicons.documents_outline, 'Terms and Conditions', () {
              Navigator.pop(context);
            }),
            buildDrawerItem(context, Ionicons.call_outline, 'Contact Us', () {
              Navigator.pop(context);
            }),
            buildDrawerItem(context, Ionicons.notifications_outline, 'Notifications', () {
              Navigator.pop(context);
            }),
            buildDrawerItem(context, Ionicons.trash_outline, 'Delete Account', () {
              Navigator.pop(context);
            }),
            buildDrawerItem(context, Ionicons.log_out_outline, 'Log out', () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }

  // Function to build a single drawer item
  Widget buildDrawerItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      leading: Icon(
        icon,
        color: Colors.red, // White color for the icons to match the text
      ),
      title: Text(
        title,
        style: textTheme.titleSmall?.copyWith(
          color: Colors.red, // White text color for better contrast
        ),
      ),
      onTap: onTap,
    );
  }
}
