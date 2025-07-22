class UserInfo {
  String uid;
  String userName;
  String email;
  String mobile;
  String address;
  String city;
  String state;
  String pincode;
  String country;
  String planName;
  String planType;
  int planAmount;
  DateTime? dateOfBirth;
  String accountNumber;
  String reenterAccountNumber;
  String ifscCode;
  String branch;
  String pan;
  String idProofType;
  String idProofNumber;
  String nomineeName;
  String nomineeRelation;
  double goldRate;


  //airtable heplers
  String? airtableRecordId;
  DateTime? createdAt;
  String? paymentId;

  UserInfo({
    required this.uid,
    required this.userName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.country,
    required this.planName,
    required this.planType,
    required this.planAmount,
    this.dateOfBirth,
    required this.accountNumber,
    required this.reenterAccountNumber,
    required this.ifscCode,
    required this.branch,
    required this.pan,
    required this.idProofType,
    required this.idProofNumber,
    required this.nomineeName,
    required this.nomineeRelation,
    required this.goldRate,

    this.airtableRecordId,
    this.createdAt,
    this.paymentId,
  });

  String get formattedIdProof => "$idProofType: $idProofNumber";

// Additional methods to validate or format user data can be added here
}
