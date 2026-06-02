import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lotusandgems/screens/existingplan_page.dart';
import 'package:lotusandgems/screens/plan_list_page.dart';
import 'package:lotusandgems/screens/myplan_page.dart';
import 'package:lotusandgems/screens/profile_page.dart';
import 'package:lotusandgems/screens/transaction_page.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/device_utility.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';
import 'package:lotusandgems/widgets/planroundbutton.dart';

class AllPlanContainer extends StatelessWidget {
  const AllPlanContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MKDeviceUtils.getScreenWidth(context),
     // height: MKDeviceUtils.getScreenHeight(context) * 0.3, // Adjusted height
       color: MKColors.secondary?.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: MKSizes.md,),
          // Title Text
          Text(
            "Monthly Investment Plans",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: MKSizes.md,), // Space between title and buttons

          // Buttons Grid (Three in the first row, two in the second row)
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                // First Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundPlanButton(
                      label: "My Plan",
                      icon: Ionicons.person_outline,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyPlanScreen()),
                        );
                      },
                      //backgroundColor: Colors.orangeAccent.shade200,
                    ),
                    RoundPlanButton(
                      label: "Join Plan",
                      icon: Ionicons.people_outline,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlanListScreen()),
                        );
                      },
                    ),
                    RoundPlanButton(
                      label: "Add\nExisting",
                      icon: Ionicons.list_outline,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddExistingPlanPage()),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: MKSizes.lg,),

                // Second Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    RoundPlanButton(
                      label: "Profile",
                      icon: Ionicons.person_circle_outline,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                        );
                      },
                    ),
                    RoundPlanButton(
                      label: "Transactions",
                      icon: Ionicons.receipt_outline,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransactionScreen()),
                        );
                      },
                    ),
                   //const SizedBox(width: MKSizes.md,),
                    RoundPlanButton(
                      label: "QuickPay",
                      icon: Ionicons.cash_outline,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                        );
                      },
                    ),

                  ],
                ),
                const SizedBox(height: MKSizes.lg,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
