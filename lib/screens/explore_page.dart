import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/widgets/customappbar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        logoAssetPath: MKImg.lgLogo2,
      ),
      body: const Center(
        child: Text(
          "Explore Page",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
