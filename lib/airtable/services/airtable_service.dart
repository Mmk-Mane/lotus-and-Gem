import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lotusandgems/airtable/airtable_config.dart';
import 'package:lotusandgems/airtable/services/model/AmountBasedPlanModel.dart';
import 'package:lotusandgems/airtable/services/model/EMIPayment.dart';
import 'package:lotusandgems/airtable/services/model/WeightBasedPlan.dart';

class AirtableService {
  final Map<String, String> _headers = {
    'Authorization': 'Bearer $airtableApiKey',
    'Content-Type': 'application/json'
  };

  Future<int> countPlans(String tableName) async {
    final url = Uri.parse('$airtableBaseUrl/$airtableBaseId/$tableName');
    final response = await http.get(url, headers: _headers);

    if (response.statusCode == 200) {
      final List<dynamic> records = jsonDecode(response.body)['records'];
      return records.length;
    } else {
      print('Count failed: ${response.statusCode}');
      return 0;
    }
  }
  // ---------- POST METHODS ----------

  Future<bool> postAmountBasedPlan(AmountBasedPlan plan) async {
    final url =
        Uri.parse('$airtableBaseUrl/$airtableBaseId/$amountBasedPlanTable');
    final body = jsonEncode({'fields': plan.toJson()});

    print("📤 Sending AmountBasedPlan to Airtable: $body");

    final response = await http.post(url, headers: _headers, body: body);

    print(
        "✅ Response [AmountBasedPlan]: ${response.statusCode} | ${response.body}");

    return response.statusCode == 200 || response.statusCode == 201;
  }

  Future<bool> postWeightBasedPlan(WeightBasedPlan plan) async {
    final url =
        Uri.parse('$airtableBaseUrl/$airtableBaseId/$weightBasedPlanTable');
    final body = jsonEncode({'fields': plan.toJson()});

    print("📤 Sending WeightBasedPlan to Airtable: $body");

    final response = await http.post(url, headers: _headers, body: body);

    print(
        "✅ Response [WeightBasedPlan]: ${response.statusCode} | ${response.body}");

    return response.statusCode == 200 || response.statusCode == 201;
  }

  Future<bool> postEmiPayment(EMIPayment payment) async {
    final url = Uri.parse('$airtableBaseUrl/$airtableBaseId/$emiPaymentTable');
    final body = jsonEncode({'fields': payment.toJson()});

    print("📤 Sending EMIPayment to Airtable: $body");

    final response = await http.post(url, headers: _headers, body: body);

    print("✅ Response [EMIPayment]: ${response.statusCode} | ${response.body}");

    return response.statusCode == 200 || response.statusCode == 201;
  }


  Future<String?> fetchRecordIdByGroupId(
      String tableName, String groupId) async {
    final url = Uri.parse(
        '$airtableBaseUrl/$airtableBaseId/$tableName?filterByFormula=groupId="$groupId"');

    final response = await get(url, headers: _headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final records = data['records'] as List<dynamic>;
      if (records.isNotEmpty) {
        return records[0]['id'];
      }
    } else {
      debugPrint(
          "❌ Failed to fetch Airtable record ID. Status: ${response.statusCode}");
    }

    return null;
  }

  // ---------- GET METHODS ----------

  Future<List<AmountBasedPlan>> fetchAmountBasedPlans(String uid) async {
    final url = Uri.parse(
        '$airtableBaseUrl/$airtableBaseId/$amountBasedPlanTable?filterByFormula=uid="$uid"');
    final response = await http.get(url, headers: _headers);

    if (response.statusCode == 200) {
      final List<dynamic> records = jsonDecode(response.body)['records'];
      return records.map((r) => AmountBasedPlan.fromJson(r['fields'])).toList();
    } else {
      throw Exception('Failed to load amount-based plans');
    }
  }

  Future<List<WeightBasedPlan>> fetchWeightBasedPlans(String uid) async {
    final url = Uri.parse(
        '$airtableBaseUrl/$airtableBaseId/$weightBasedPlanTable?filterByFormula=uid="$uid"');
    final response = await http.get(url, headers: _headers);

    if (response.statusCode == 200) {
      final List<dynamic> records = jsonDecode(response.body)['records'];
      return records.map((r) => WeightBasedPlan.fromJson(r['fields'])).toList();
    } else {
      throw Exception('Failed to load weight-based plans');
    }
  }

  Future<List<EMIPayment>> fetchEmiPaymentsByGroupId(String groupId) async {
    final url = Uri.parse(
        '$airtableBaseUrl/$airtableBaseId/$emiPaymentTable?filterByFormula=OR(groupIdbasedamountplans="$groupId", groupidbasedonweightplan="$groupId")');
    final response = await http.get(url, headers: _headers);

    if (response.statusCode == 200) {
      final List<dynamic> records = jsonDecode(response.body)['records'];
      return records.map((r) => EMIPayment.fromJson(r['fields'])).toList();
    } else {
      throw Exception('Failed to load EMI payments');
    }
  }
}
