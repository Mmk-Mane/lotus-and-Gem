import 'package:lotusandgems/data/user_info.dart';

class AmountBasedPlan {
  String groupId;
  String uid;
  String customerName;
  String customerEmail;
  String customerMobile;
  String customerAddress; // full address already combined
  DateTime? customerDOB;
  String customerPAN;
  String customerAccountNumber;
  String ifscCode;
  String bankName;
  String customerIdProof;
  String customerIdProofNumber;
  String nomineeName;
  String nomineeRelation;
  int monthlyEmi;
  int durationMonths;
  double goldRate;
  DateTime startDate;

  // Airtable-only fields (calculated, not sent)
  DateTime? nextEmiDate;
  String? autoStatus;
  DateTime? maturityDate;

  // Optional helpers
  String? airtableRecordId;
  DateTime? createdAt;

  AmountBasedPlan({
    required this.groupId,
    required this.uid,
    required this.customerName,
    required this.customerEmail,
    required this.customerMobile,
    required this.customerAddress,
    this.customerDOB,
    required this.customerPAN,
    required this.customerAccountNumber,
    required this.ifscCode,
    required this.bankName,
    required this.customerIdProof,
    required this.customerIdProofNumber,
    required this.nomineeName,
    required this.nomineeRelation,
    required this.monthlyEmi,
    this.durationMonths = 11,
    required this.goldRate,
    required this.startDate,
    this.nextEmiDate,
    this.autoStatus,
    this.maturityDate,
    this.airtableRecordId,
    this.createdAt,
  });

  factory AmountBasedPlan.fromJson(Map<String, dynamic> json) {
    return AmountBasedPlan(
      groupId: json['groupId'] ?? '',
      uid: json['uid'] ?? '',
      customerName: json['customerName'] ?? '',
      customerEmail: json['customeremail'] ?? '',
      customerMobile: json['customermobile'] ?? '',
      customerAddress: json['customeraddress'] ?? '',
      customerDOB: json['customerDOB'] != null
          ? DateTime.tryParse(json['customerDOB'])
          : null,
      customerPAN: json['customerPAN'] ?? '',
      customerAccountNumber: json['customeraccountnumber'] ?? '',
      ifscCode: json['ifsccode'] ?? '',
      bankName: json['bankname'] ?? '',
      customerIdProof: json['customeridproof'] ?? '',
      customerIdProofNumber: json['customeridproofnumber'] ?? '',
      nomineeName: json['nomineeName'] ?? '',
      nomineeRelation: json['nomineeRelation'] ?? '',
      monthlyEmi: json['monthlyEmi'] ?? 0,
      durationMonths: json['durationMonths'] ?? 11,
      goldRate: (json['GoldRate'] ?? 0).toDouble(),
      startDate: DateTime.tryParse(json['startDate'] ?? '') ?? DateTime.now(),
      nextEmiDate: json['nextEmiDate'] != null
          ? DateTime.tryParse(json['nextEmiDate'])
          : null,
      maturityDate: json['maturityDate'] != null
          ? DateTime.tryParse(json['maturityDate'])
          : null,
      autoStatus: json['autoStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "groupId": groupId,
      "uid": uid,
      "customerName": customerName,
      "customeremail": customerEmail,
      "customermobile": customerMobile,
      "customeraddress": customerAddress,
      "customerDOB": customerDOB?.toIso8601String(),
      "customerPAN": customerPAN,
      "customeraccountnumber": customerAccountNumber,
      "ifsccode": ifscCode,
      "bankname": bankName,
      "customeridproof": customerIdProof,
      "customeridproofnumber": customerIdProofNumber,
      "nomineeName": nomineeName,
      "nomineeRelation": nomineeRelation,
      "monthlyEmi": monthlyEmi,
      "durationMonths": durationMonths,
      "GoldRate": goldRate,
      'startDate': startDate!.toIso8601String().split('T').first,

      // ❌ Don't include maturityDate, autoStatus, nextEmiDate – handled in Airtable formulas
    };
  }

  factory AmountBasedPlan.fromUserInfo(
      UserInfo user, String groupId, DateTime now) {
    return AmountBasedPlan(
      groupId: groupId,
      uid: user.uid,
      customerName: user.userName,
      customerEmail: user.email,
      customerMobile: user.mobile,
      customerAddress: '${user.address}, ${user.city}, ${user.country}',
      customerDOB: user.dateOfBirth,
      customerPAN: user.pan,
      customerAccountNumber: user.accountNumber,
      ifscCode: user.ifscCode,
      bankName: user.branch,
      customerIdProof: user.idProofType,
      customerIdProofNumber: user.idProofNumber,
      nomineeName: user.nomineeName,
      nomineeRelation: user.nomineeRelation,
      monthlyEmi: user.planAmount,
      durationMonths: 11, // default
      goldRate: user.goldRate,
      startDate: now,
    );
  }
}
