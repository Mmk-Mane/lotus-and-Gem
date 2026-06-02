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
  UserInfo copyWith({
    String? uid,
    String? userName,
    String? email,
    String? mobile,
    String? address,
    String? city,
    String? state,
    String? pincode,
    String? country,
    String? planName,
    String? planType,
    int? planAmount,
    DateTime? dateOfBirth,
    String? accountNumber,
    String? reenterAccountNumber,
    String? ifscCode,
    String? branch,
    String? pan,
    String? idProofType,
    String? idProofNumber,
    String? nomineeName,
    String? nomineeRelation,
    double? goldRate,
    String? airtableRecordId,
    DateTime? createdAt,
    String? paymentId,
  }) {
    return UserInfo(
      uid: uid ?? this.uid,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      country: country ?? this.country,
      planName: planName ?? this.planName,
      planType: planType ?? this.planType,
      planAmount: planAmount ?? this.planAmount,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      accountNumber: accountNumber ?? this.accountNumber,
      reenterAccountNumber: reenterAccountNumber ?? this.reenterAccountNumber,
      ifscCode: ifscCode ?? this.ifscCode,
      branch: branch ?? this.branch,
      pan: pan ?? this.pan,
      idProofType: idProofType ?? this.idProofType,
      idProofNumber: idProofNumber ?? this.idProofNumber,
      nomineeName: nomineeName ?? this.nomineeName,
      nomineeRelation: nomineeRelation ?? this.nomineeRelation,
      goldRate: goldRate ?? this.goldRate,
      airtableRecordId: airtableRecordId ?? this.airtableRecordId,
      createdAt: createdAt ?? this.createdAt,
      paymentId: paymentId ?? this.paymentId,
    );
  }
}
