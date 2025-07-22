import 'package:flutter/material.dart';
import 'package:lotusandgems/screens/plan_join_page.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';
import 'package:lotusandgems/widgets/customappbar.dart';

class PlanDetailsBody extends StatelessWidget {
  final String title; // The title passed from the PlanContainer

  const PlanDetailsBody({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          logoAssetPath: MKImg.lgLogo2,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Title Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: MKColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: MKSizes.md),
                Text(
                  "Book Your Monthly Plan. Get Advantage of\nGold Rate Fluctuations + No VA Benefit",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                    color: MKColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: MKSizes.lg),

            Image.asset(MKImg.exampleTable),//
            const SizedBox(height: MKSizes.md),// Table Section
             Text("* Figures shown are for demonstration only and\n do not represent final values.",
               style: Theme.of(context)
                 .textTheme
                 .bodySmall
                 ?.copyWith(
               color: MKColors.warning,
             ),
               textAlign: TextAlign.center,
             ),

            const SizedBox(height: MKSizes.lg),


            // Join Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CustomPlanJoinPage(planName: title,),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MKColors.primary,
                  padding: const EdgeInsets.symmetric(
                      vertical: MKSizes.buttonHeight),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MKSizes.buttonRadius),
                  ),
                ),
                child: Text(
                  "Join Now",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                    color: MKColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
