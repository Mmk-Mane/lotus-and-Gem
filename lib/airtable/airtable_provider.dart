import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lotusandgems/airtable/airtable_config.dart';
import 'package:lotusandgems/airtable/services/airtable_service.dart';
import 'package:lotusandgems/airtable/services/model/AmountBasedPlanModel.dart';
import 'package:lotusandgems/airtable/services/model/EMIPayment.dart';
import 'package:lotusandgems/airtable/services/model/WeightBasedPlan.dart';

class AirtableProvider extends ChangeNotifier {
  final AirtableService _airtableService = AirtableService();

  // State
  bool isLoading = false;
  String? errorMessage;

  // Data
 // List<AmountBasedPlan> amountPlans = [];
  List<AmountBasedPlan> amountPlans = [];
  List<WeightBasedPlan> weightPlans = [];
  List<EMIPayment> emiPayments = [];

  // ------------ POST METHODS ------------

  Future<bool> postAmountBasedPlan(AmountBasedPlan plan) async {
    isLoading = true;
    notifyListeners();

    try {
      final success = await _airtableService.postAmountBasedPlan(plan);
      if (!success) errorMessage = "Failed to save amount-based plan.";
      return success;
    } catch (e) {
      errorMessage = "Error saving amount-based plan: $e";
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> postWeightBasedPlan(WeightBasedPlan plan) async {
    isLoading = true;
    notifyListeners();

    try {
      final success = await _airtableService.postWeightBasedPlan(plan);
      if (!success) errorMessage = "Failed to save weight-based plan.";
      return success;
    } catch (e) {
      errorMessage = "Error saving weight-based plan: $e";
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> postEmiPayment(EMIPayment payment) async {
    isLoading = true;
    notifyListeners();

    try {
      final success = await _airtableService.postEmiPayment(payment);
      if (!success) errorMessage = "Failed to save EMI payment.";
      return success;
    } catch (e) {
      errorMessage = "Error saving EMI payment: $e";
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> fetchRecordIdByGroupId(String tableName, String groupId) async {
    try {
      return await _airtableService.fetchRecordIdByGroupId(tableName, groupId);
    } catch (e) {
      errorMessage = "❌ Provider error: $e";
      return null;
    }
  }



  // ------------ GET METHODS ------------

  Future<void> fetchAmountPlans(String uid) async {
    isLoading = true;
    notifyListeners();

    try {
      amountPlans = await _airtableService.fetchAmountBasedPlans(uid);
    } catch (e) {
      errorMessage = "Error loading amount-based plans: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWeightPlans(String uid) async {
    isLoading = true;
    notifyListeners();

    try {
      weightPlans = await _airtableService.fetchWeightBasedPlans(uid);
    } catch (e) {
      errorMessage = "Error loading weight-based plans: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchEmiPayments(String groupId) async {
    isLoading = true;
    notifyListeners();

    try {
      emiPayments = await _airtableService.fetchEmiPaymentsByGroupId(groupId);
    } catch (e) {
      errorMessage = "Error loading EMI payments: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Reset errors
  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}
