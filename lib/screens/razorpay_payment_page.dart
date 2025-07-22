/*
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  final int amount; // Amount in paise (e.g., ₹100 = 10000 paise)
  final String planName;
  final String userName;
  final String mobileNumber;
  final String emailId;

  const PaymentPage({
    Key? key,
    required this.amount,
    required this.planName,
    required this.userName,
    required this.mobileNumber,
    required this.emailId,
  }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;



  void _startPayment() {
    var options = {
      'key': 'rzp_test_yHkwvcQpM68h6o', // Replace with your Razorpay API key
      'amount': widget.amount * 100, // Amount in paise
      'name': 'Lotus and Gems',
      'description': widget.planName,
      'prefill': {
        'name': widget.userName,
        'email': widget.emailId,
        'contact': widget.mobileNumber,
      },
      'theme': {
        'color': '#F5B041', // Optional: Set a color theme
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error in payment initialization."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Page"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Payment Summary
            Text(
              "Payment Summary",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(color: Colors.grey),
            _buildDetailRow("Plan Name", widget.planName),
            _buildDetailRow("Amount", "₹${(widget.amount / 100).toStringAsFixed(2)}"),
            _buildDetailRow("User Name", widget.userName),
            _buildDetailRow("Email ID", widget.emailId),
            _buildDetailRow("Mobile Number", widget.mobileNumber),

            const Spacer(),

            // Pay Now Button
            Center(
              child: ElevatedButton(
                onPressed: _startPayment,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  backgroundColor: Colors.orange,
                ),
                child: const Text(
                  "Pay Now",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
*/
