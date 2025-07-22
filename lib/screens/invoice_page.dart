import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/device_utility.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';

import 'package:lotusandgems/widgets/customappbar.dart';

class InvoicePage extends StatefulWidget {
  final Map<String, dynamic> transactionDetails;

  InvoicePage({super.key, required this.transactionDetails});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MKDeviceUtils.getScreenWidth(context);
    double screenHeight = MKDeviceUtils.getScreenHeight(context);

    // Extract transaction details with null safety
    final String paymentStatus =
        widget.transactionDetails["paymentStatus"] ?? 'Not Available';
    final String customerName =
        widget.transactionDetails["customerName"] ?? 'Not Available';
    final String groupCode =
        widget.transactionDetails["groupCode"] ?? 'Not Available';
    final String transactionID =
        widget.transactionDetails["transactionID"] ?? 'Not Available';
    final String txnTime =
        widget.transactionDetails["time"] ?? 'Not Available';
    final String transactionFee =
        widget.transactionDetails["transactionFee"] ?? 'Not Available';
    final String amount =
        widget.transactionDetails["amount"] ?? 'Not Available';
    final String purchaseWeight =
        widget.transactionDetails["purchaseWeight"] ?? '0';
    final String planType =
        widget.transactionDetails["planType"] ?? 'Not Available';
    final String planName =
        widget.transactionDetails["planName"] ?? 'Not Available';

    return Scaffold(
      appBar:  CustomAppBar(
        logoAssetPath: MKImg.lgLogo2,
      ),
      body: Stack(
        children: [
          // Blue header section
          Container(
            width: screenWidth,
            height: screenHeight * 0.25, // Takes 25% of the screen height
            color: MKColors.primary,
          ),
          // Remaining content section
          Positioned(
            top: screenHeight * 0.25, // Start below the blue section
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.75, // Remaining height
              color: MKColors.primaryBackground,
            ),
          ),
          // White container in the center of the screen
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Circular Icon and Repayment Successful/Failure Text
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        // Green or Red circular icon based on payment status
                        Align(
                          alignment: Alignment.topCenter,
                          child: Transform.translate(
                            offset: const Offset(0, -40),
                            child: Container(
                              height: 80,
                              width: 80,

                              child: Image.asset(
                                paymentStatus == 'Successful'
                                    ? MKImg.sucesslogo : MKImg.failurelogo,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              Text(
                                "Payment Status: $paymentStatus",
                                style: TextStyle(
                                  color: paymentStatus == 'Successful'
                                      ? MKColors.success
                                      : MKColors.warning,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "₹$amount",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Payment Details
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildDetailRow("Plan Name", planName),
                          buildDetailRow("Customer Name", customerName),
                          buildDetailRow("Group Code", groupCode),
                          const SizedBox(height: 20),
                          Divider(color: Colors.grey.shade300),
                          buildDetailRow("Txn Ref ID", transactionID),
                          buildDetailRow("Txn Time", txnTime),
                          buildDetailRow("Transaction Fee", transactionFee),
                          const SizedBox(height: 20),
                          Divider(color: Colors.grey.shade300),
                          buildDetailRow("Total", "₹$amount"),
                          buildDetailRow(
                            "Weight",
                            planType == 'weight-based'
                                ? '$purchaseWeight gm'
                                : 'Not Applicable',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey,
                              ),
                              child: const Text(
                                "Share Receipt",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MKColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text("Download"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
