import 'package:flutter/material.dart';
import 'package:lotusandgems/data/userinfor_provider.dart';
import 'package:intl/intl.dart';
import 'package:lotusandgems/screens/transcation_page.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/widgets/customappbar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';
import 'package:lotusandgems/widgets/customelevatedbutton.dart';
import 'package:provider/provider.dart';
import 'package:lotusandgems/payment/razorpay_service.dart';

class PlanOrderConfirmationPage extends StatefulWidget {
  const PlanOrderConfirmationPage({super.key});

  @override
  _PlanOrderConfirmationPageState createState() =>
      _PlanOrderConfirmationPageState();
}

class _PlanOrderConfirmationPageState extends State<PlanOrderConfirmationPage> {
  bool _isInfoCorrect = false;
  late RazorpayService razorpayService;


  @override
  void initState() {
    super.initState();
    razorpayService = RazorpayService(context);
  }

  @override
  void dispose() {
    razorpayService.dispose();
    super.dispose();
  }

  //information related class
  void _proceedToPaymentPage() {
    if (_isInfoCorrect) {
      final userInfo =
          Provider.of<UserInfoProvider>(context, listen: false).userInfo;
      razorpayService.startPayment(userInfo);
// clean, readable
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please confirm that the information is correct."),
          backgroundColor: MKColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<UserInfoProvider>(context).userInfo;

    return Scaffold(
      backgroundColor: MKColors.primaryBackground,
      appBar:  CustomAppBar(
        logoAssetPath: MKImg.lgLogo2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Checkout Heading
              _buildCenteredHeading("Checkout"),

              const SizedBox(height: MKSizes.defaultSpace),

              // Plan Summary Section
              _buildSectionHeader("Plan Summary"),
              _buildDetailRow("Plan Name", userDetails.planName),
              _buildDetailRow(
                  "Installment Amount", "₹${userDetails.planAmount}"),

              const SizedBox(height: MKSizes.defaultSpace),

              // Billing Details Section
              _buildSectionHeader("Billing Details"),
              _buildDetailRow("Name", userDetails.userName),
              _buildDetailRow("Email ID", userDetails.email),
              _buildDetailRow("Mobile Number", userDetails.mobile),
              _buildDetailRow(
                "Address",
                "${userDetails.address},\n${userDetails.city}, ${userDetails.state}",
                // isMultiline: true,
              ),

              const SizedBox(height: MKSizes.defaultSpace),

              // Bank Details Section
              _buildSectionHeader("Bank Details"),
              _buildDetailRow("Account Number", userDetails.accountNumber),
              _buildDetailRow("IFSC Code", userDetails.ifscCode),
              _buildDetailRow("Branch Name", userDetails.branch),

              const SizedBox(height: MKSizes.defaultSpace),

              // Confirm Checkbox Section
              _buildConfirmCheckbox(),

              const SizedBox(height: MKSizes.defaultSpace),

              // Confirm and Pay Button
              _buildConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Centered Heading
  Widget _buildCenteredHeading(String title) {
    return Center(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: MKColors.primary,
            ),
      ),
    );
  }

  // Section Header
  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
        ),
        const Divider(color: Colors.grey), // Gray divider after section header
      ],
    );
  }

  // Detail Row for each information field
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label with fixed width
          SizedBox(
            width: 110, // Adjust width to suit your label length
            child: Text(
              "$label:",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          // Spacer between label and value
          const SizedBox(width: 8),
          // Right-aligned multiline value
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  // Confirm Checkbox Section
  Widget _buildConfirmCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _isInfoCorrect,
          onChanged: (bool? value) {
            setState(() {
              _isInfoCorrect = value ?? false;
            });
          },
        ),
        Expanded(
          child: Text(
            "I confirm that the information above is correct.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }

  // Confirm and Pay Button
  Widget _buildConfirmButton() {
    return Center(
      child: CustomElevatedButton(
        onPressed: _proceedToPaymentPage,
        label: "Confirm and Pay",
      ),
    );
  }
}
