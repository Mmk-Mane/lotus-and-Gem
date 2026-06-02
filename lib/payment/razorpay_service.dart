import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lotusandgems/airtable/services/airtable_service.dart';
import 'package:lotusandgems/airtable/services/model/AmountBasedPlanModel.dart';
import 'package:lotusandgems/airtable/services/model/EMIPayment.dart';
import 'package:lotusandgems/airtable/services/model/WeightBasedPlan.dart';
import 'package:lotusandgems/data/user_info.dart';
import 'package:lotusandgems/screens/success_screen.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/data/user_info_provider.dart';
import 'package:lotusandgems/airtable/airtable_config.dart';

import '../airtable/airtable_provider.dart';


class RazorpayService {
  final BuildContext context;
  late Razorpay _razorpay;

  RazorpayService(this.context) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void startPayment(UserInfo userDetails) {
    String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    var options = {
      'key': 'rzp_test_yHkwvcQpM68h6o',
      'amount': userDetails.planAmount * 100,
      'name': 'Lotus and Gems',
      'description': userDetails.planName,
      'prefill': {
        'name': userDetails.userName,
        'email': userDetails.email,
        'contact': userDetails.mobile,
      },
      'theme': {'color': '#F5B041'},
      'notes': {
        'order_date_time': formattedDateTime,
      },
      'method': 'upi|card|wallet',
      'payment_capture': 1,
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error initializing payment."),
          backgroundColor: MKColors.error,
        ),
      );
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Payment Successful: ${response.paymentId}"),
        backgroundColor: MKColors.success,
      ),
    );

    final userInfoProvider = Provider.of<UserInfoProvider>(context, listen: false);
    final airtableProvider = Provider.of<AirtableProvider>(context, listen: false);
    final userInfo = userInfoProvider.userInfo;

    try {
      final planTable = userInfo.planType == "AB"
          ? amountBasedPlanTable
          : weightBasedPlanTable;

      final planCount = await AirtableService().countPlans(planTable);
      final String year = DateFormat('yyyy').format(DateTime.now());
      final String groupId =
          "GG${userInfo.planType}$year${(planCount + 1).toString().padLeft(2, '0')}";
      final now = DateTime.now();

      bool planSaved = false;
      print("🔧 Generating plan with groupId: $groupId");

      if (userInfo.planType == "AB") {
        final plan = AmountBasedPlan.fromUserInfo(userInfo, groupId, now);
        print("📤 Posting AmountBasedPlan: ${plan.toJson()}");
        planSaved = await airtableProvider.postAmountBasedPlan(plan);
      } else {
        final plan = WeightBasedPlan.fromUserInfo(userInfo, groupId, now);
        print("📤 Posting WeightBasedPlan: ${plan.toJson()}");
        planSaved = await airtableProvider.postWeightBasedPlan(plan);
      }

      final recordId = await airtableProvider.fetchRecordIdByGroupId(planTable, groupId ?? "");


      final emi = EMIPayment.fromUserInfo(
        user: userInfo,
        paymentId: response.paymentId ?? "",
        groupId: groupId ?? "", // ✅ Use Airtable recordId, not custom groupId
        isAmountBased: userInfo.planType == "AB",
        goldRate: userInfo.goldRate ?? 0,
        paymentDate: now,
        transactionId: response.paymentId ?? "",
        method: "Razorpay",
      );

      print("📤 Posting EMIPayment: ${emi.toJson()}");
      final paymentSaved = await airtableProvider.postEmiPayment(emi);

      if (planSaved && paymentSaved) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SuccessScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              airtableProvider.errorMessage ?? "❌ Failed to save data. Please contact support.",
            ),
            backgroundColor: MKColors.error,
          ),
        );
      }
    } catch (e) {
      print("❌ Exception in payment success logic: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Unexpected error: $e"),
          backgroundColor: MKColors.error,
        ),
      );
    }
  }


  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Payment Failed: ${response.code}\n${response.message}"),
        backgroundColor: MKColors.error,
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("External Wallet Selected: ${response.walletName}"),
        backgroundColor: MKColors.warning,
      ),
    );
  }

  void dispose() {
    _razorpay.clear();
  }
}
