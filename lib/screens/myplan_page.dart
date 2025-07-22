import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/widgets/customappbar.dart';

class MyPlanScreen extends StatelessWidget {
  const MyPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        logoAssetPath: MKImg.lgLogo2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            Text(
              "Your Active Plans",
              style: Theme.of(context).textTheme.headlineLarge, // Use theme styling
            ),
            const SizedBox(height: 16),

            // Active Plan Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded edges
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Plan Title
                    Text(
                      "Gold Savings Plan",
                      style: Theme.of(context).textTheme.titleMedium,
                      ),

                    const SizedBox(height: 8),

                    // Plan Details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Duration: 11 months",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "EMI: ₹5000",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Progress Bar
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Progress",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          value: 0.6, // Example progress value
                          color: Colors.green,
                          backgroundColor: Colors.grey[300],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Add More Plans Button

          ],
        ),
      ),
    );
  }
}
