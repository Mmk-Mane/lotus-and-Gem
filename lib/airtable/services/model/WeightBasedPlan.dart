import 'package:lotusandgems/data/user_info.dart';

class WeightBasedPlan {
  String groupId;
  String uid;
  String customerName;
  String customerEmail;
  String customerMobile;
  String customerAddress; // Combined full address
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

  // Auto-calculated fields in Airtable
  double? savedGold; // = EMI / GoldRate
  DateTime? nextEmiDate; // formula in Airtable
  String? autoStatus; // formula in Airtable
  DateTime? maturityDate; // formula in Airtable

  // Helpers
  String? airtableRecordId;
  DateTime? createdAt;

  WeightBasedPlan({
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
    this.savedGold,
    this.nextEmiDate,
    this.autoStatus,
    this.maturityDate,
    this.airtableRecordId,
    this.createdAt,
  });

  factory WeightBasedPlan.fromJson(Map<String, dynamic> json) {
    return WeightBasedPlan(
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
      durationMonths: json['dureationMonths'] ?? 11,
      goldRate: (json['GoldRate'] ?? 0).toDouble(),
      savedGold: (json['savedGold'] ?? 0).toDouble(),
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
      "goldRate": goldRate,
      'startDate': startDate!.toIso8601String().split('T').first,
    };
  }

  factory WeightBasedPlan.fromUserInfo(
      UserInfo user, String groupId, DateTime now) {
    return WeightBasedPlan(
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
        durationMonths: 11,
        goldRate: user.goldRate ?? 0,
        startDate: now,
        savedGold: 0,
        monthlyEmi: user.planAmount // optional, will be updated later
        );
  }
}
