import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/widgets/customappbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        logoAssetPath: MKImg.lgLogo2,
      ),
      body: const Center(
        child: Text(
          "Profile Page",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
