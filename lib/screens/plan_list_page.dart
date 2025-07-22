import 'package:flutter/material.dart';
import 'package:lotusandgems/screens/plandetails_page.dart';

import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/utils/constants/plan_constants.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';
import 'package:lotusandgems/widgets/customappbar.dart';
import 'package:lotusandgems/widgets/plancontainer.dart';

class PlanListScreen extends StatefulWidget {
  const PlanListScreen({super.key});

  @override
  State<PlanListScreen> createState() => _PlanListScreenState();
}

const String planNameWgt = PlanConstants.planNameWeightBased;
const String planNameAmt = PlanConstants.planNameAmountBased;

class _PlanListScreenState extends State<PlanListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        logoAssetPath: MKImg.lgLogo2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Our Best Saving Plans",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: MKSizes.defaultSpace,
              ),
              PlanContainer(
                title: planNameWgt,
                details: "10+1 Monthly Plan",
                subtitle: "Accumulated Gold Weight",
                onButtonPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlanDetailsBody(
                        title: planNameWgt,
                      ), // Corrected the method name and syntax
                    ),
                  );
                },
                backgroundImage: MKImg.cardbg1,
                badgeImage: MKImg.goldbatch,
              ),
              SizedBox(
                height: MKSizes.defaultSpace,
              ),
              PlanContainer(
                title: planNameAmt,
                details: "10+1 Monthly Plan",
                subtitle: "Accumulated Amount",
                onButtonPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlanDetailsBody(
                        title: planNameAmt,
                      ), // Corrected the method name and syntax
                    ),
                  );
                },
                backgroundImage: MKImg.cardbg2,
                badgeImage: MKImg.goldbatch,
              ),
              SizedBox(
                height: MKSizes.defaultSpace,
              ),
              Image.asset(MKImg.banner1),
            ],
          ),
        ),
      ),
    );
  }
}
