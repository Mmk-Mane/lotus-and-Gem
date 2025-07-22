import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';
import 'package:lotusandgems/widgets/custom_text_inputfeild.dart';
import 'package:lotusandgems/widgets/customappbar.dart';
import 'package:lotusandgems/widgets/customelevatedbutton.dart';


class AddExistingPlanPage extends StatelessWidget {
  final TextEditingController _memberIDController = TextEditingController();
  final TextEditingController _groupCodeController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailIdController = TextEditingController();

  AddExistingPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MKColors.primaryBackground,
      appBar:  CustomAppBar(
        logoAssetPath: MKImg.lgLogo2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Add Your Existing Plan",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: MKSizes.defaultSpace),
            Center(
              child: Text(
                "Fill in your details to your plan.",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: MKSizes.spaceBtwInputFields),
            // Plan ID Field
            CustomTextInputField(
              title: "Member ID",
              icon: Icons.card_membership,
              controller: _memberIDController,
            ),
            const SizedBox(height: MKSizes.spaceBtwInputFields),
            // Customer ID Field
            CustomTextInputField(
              title: "Group Code",
              icon: Icons.person,
              controller: _groupCodeController,
            ),
            const SizedBox(height: MKSizes.spaceBtwInputFields),
            // Account Number Field
            CustomTextInputField(
              title: "Mobile number",
              icon: Icons.mobile_friendly,
              controller: _memberIDController,
              isNumeric: true,
            ),
            const SizedBox(height: MKSizes.spaceBtwInputFields),
            // IFSC Code Field
            CustomTextInputField(
              title: "Email ID",
              icon: Icons.mail_lock,
              controller: _emailIdController,
            ),
            const SizedBox(height: MKSizes.defaultSpace),
            // Confirm Button
            Center(
              child: CustomElevatedButton(
                label: "Sync",
                onPressed: () {
                  // Handle migration logic here
                  final planID = _groupCodeController.text.trim();
                  final customerID = _memberIDController.text.trim();
                  final accountNumber = _memberIDController.text.trim();
                  final ifscCode = _emailIdController.text.trim();

                  if (planID.isEmpty || customerID.isEmpty || accountNumber.isEmpty || ifscCode.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill all the required fields."),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    // Proceed with migration
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Migration request for $planID submitted."),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
