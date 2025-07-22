import 'package:lotusandgems/data/userinfo_cass.dart';

class EMIPayment {
  String paymentId;
  List<String>? groupIdAmountPlan;
  List<String>? groupIdWeightPlan;
  String? groupIdText;
  String uid;
  int emiAmount;
  DateTime paymentDate;
  double goldRate;
  double? goldWeight; // Auto-calculated in Airtable
  String? paymentMethod;
  String transcationId;
  String? airtableRecordId;

  EMIPayment({
    required this.paymentId,
    required this.uid,
    required this.emiAmount,
    required this.paymentDate,
    required this.goldRate,
    required this.transcationId,
    this.groupIdAmountPlan,
    this.groupIdWeightPlan,
    this.groupIdText,
    this.goldWeight,
    this.paymentMethod,
    this.airtableRecordId,
  });

  Map<String, dynamic> toJson() {
    return {
      "paymentId": paymentId,
      "groupIdbasedamountplans": groupIdAmountPlan,
      "groupidbasedonweightplan": groupIdWeightPlan,
      "groupIdText": groupIdText,
      "uid": uid,
      "emiAmount": emiAmount,
      "paymentDate": paymentDate.toIso8601String().split('T').first,
      "goldRate": goldRate,
      "paymentMethod": paymentMethod,
      "transcationid": transcationId,
    };
  }

  factory EMIPayment.fromJson(Map<String, dynamic> json) {
    return EMIPayment(
      paymentId: json["paymentId"] ?? "",
      groupIdAmountPlan: json["groupIdbasedamountplans"] != null
          ? List<String>.from(json["groupIdbasedamountplans"])
          : null,
      groupIdWeightPlan: json["groupidbasedonweightplan"] != null
          ? List<String>.from(json["groupidbasedonweightplan"])
          : null,
      groupIdText: json["groupIdText"],
      uid: json["uid"] ?? "",
      emiAmount: json["emiAmount"] ?? 0,
      paymentDate:
      DateTime.tryParse(json["paymentDate"] ?? "") ?? DateTime.now(),
      goldRate: (json["goldRate"] ?? 0).toDouble(),
      goldWeight: json["goldweight"] != null
          ? (json["goldweight"] as num).toDouble()
          : null,
      paymentMethod: json["paymentMethod"],
      transcationId: json["transcationid"] ?? "",
      airtableRecordId: json["id"],
    );
  }

  factory EMIPayment.fromUserInfo({
    required UserInfo user,
    required String paymentId,
    required String groupId,
    required bool isAmountBased,
    required double goldRate,
    required DateTime paymentDate,
    required String transactionId,
    required String? method,
  }) {
    return EMIPayment(
      paymentId: paymentId,
      uid: user.uid,
      emiAmount: user.planAmount,
      paymentDate: paymentDate,
      goldRate: goldRate,
      transcationId: transactionId,
      paymentMethod: method,
      groupIdText: groupId, // save custom groupId (GGWB202501)
      groupIdAmountPlan: isAmountBased ? [groupId] : null,
      groupIdWeightPlan: isAmountBased ? null : [groupId],
    );
  }
}
