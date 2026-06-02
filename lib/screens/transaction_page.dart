import 'package:flutter/material.dart';
import 'package:lotusandgems/screens/invoice_page.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';
import 'package:lotusandgems/widgets/customappbar.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  // Sample Data with additional fields
  final List<Map<String, dynamic>> transactionData = [
    {
      'monthYear': 'June 2024',
      'paymentStatus': 'Successful',
      'amount': '₹2000',
      'purchaseDate': '5th Jun 2024',
      'installmentNumber': 1,
      'transactionID': 'T001',
      'time': '10:00 AM',
      'customerName': 'John Doe', // New detail
      'groupCode': 'GF-1234',     // New detail
    },
    {
      'monthYear': 'July 2024',
      'paymentStatus': 'Failed',
      'amount': '₹2000',
      'purchaseDate': '4th Nov 2024',
      'installmentNumber': 2,
      'transactionID': 'T002',
      'time': '12:30 PM',
      'customerName': 'Alice Smith',
      'groupCode': 'GF-1235',
    },
    {
      'monthYear': 'July 2024',
      'paymentStatus': 'Successful',
      'amount': '₹2000',
      'purchaseDate': '5th Nov 2024',
      'installmentNumber': 2,
      'transactionID': 'T003',
      'time': '02:00 PM',
      'customerName': 'Bob Brown',
      'groupCode': 'GF-1236',
    },
    {
      'monthYear': 'November 2024',
      'paymentStatus': 'Failed',
      'amount': '₹1500',
      'purchaseDate': '15th Nov 2024',
      'installmentNumber': 1,
      'transactionID': 'T004',
      'time': '04:45 PM',
      'customerName': 'Charlie Green',
      'groupCode': 'GF-1237',
    },
  ];


  String _filter = 'all';

  void _setFilter(String value) {
    setState(() {
      _filter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredTransactions = _filter == 'all'
        ? transactionData // Show all transactions if filter is "all"
        : transactionData.where((transaction) {
      return transaction['paymentStatus'] == _filter;
    }).toList();
    return Scaffold(
      backgroundColor: MKColors.primaryBackground,
      appBar:  CustomAppBar(
        logoAssetPath: MKImg.lgLogo2,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: MKSizes.md,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: MKSizes.sm,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ).merge(OutlinedButtonTheme.of(context).style),
                onPressed: () => _setFilter('all'),
                child: Text("All"),
              ),
              const SizedBox(
                width: MKSizes.sm,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 10),
                ).merge(OutlinedButtonTheme.of(context).style),
                onPressed: () => _setFilter('Successful'),
                child: Text("Successful"),
              ),
              const SizedBox(
                width: MKSizes.sm,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 10),
                ).merge(OutlinedButtonTheme.of(context).style),
                onPressed: () => _setFilter('Failed'),
                child: Text("Failed"),
              ),
            ],
          ),
          const SizedBox(
            height: MKSizes.lg,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                itemCount: filteredTransactions.length,
                itemBuilder: (context, index) {
                  final transaction = filteredTransactions[index];
                  bool isSuccessful =
                      transaction['paymentStatus'] == 'Successful';
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigate to InvoicePage with selected transaction details
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InvoicePage(transactionDetails: transaction),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction['monthYear'],
                                  style:
                                  Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(
                                  height: MKSizes.sm,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor:
                                          MKColors.primaryBackground,
                                          child: isSuccessful
                                              ? Image.asset(MKImg.sucesslogo, height: 40,)
                                              : Image.asset(MKImg.failurelogo, height: 40,),
                                        ),
                                        const SizedBox(width: MKSizes.lg),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Payment",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge),
                                            const SizedBox(height: MKSizes.sm),
                                            Text(transaction['purchaseDate'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium),
                                            const SizedBox(height: MKSizes.sm),
                                            Text(
                                                "Installment: ${transaction['installmentNumber']}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Text("Rs: ${transaction['amount']}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge),
                                        const SizedBox(height: MKSizes.sm),
                                        Text(
                                          isSuccessful
                                              ? "Successful"
                                              : "Failed",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                              color: isSuccessful
                                                  ? MKColors.primary
                                                  : Colors.red),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 2, color: Colors.black),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
