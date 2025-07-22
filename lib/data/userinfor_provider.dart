import 'package:flutter/material.dart';
import 'package:lotusandgems/data/userinfo_cass.dart';

class UserInfoProvider extends ChangeNotifier {
  UserInfo _userInfo = UserInfo(
    uid: '',
    userName: '',
    email: '',
    mobile: '',
    address: '',
    city: '',
    state: '',
    pincode: '',
    country: 'India',
    planName: '',
    planType: '',
    planAmount: 0,
    accountNumber: '',
    reenterAccountNumber: '',
    ifscCode: '',
    branch: '',
    pan: '',
    idProofType: 'Select ID Proof',
    idProofNumber: '',
    nomineeName: '',
    nomineeRelation: '',
    goldRate: 5000,
  );

  UserInfo get userInfo => _userInfo;

  // Method to update the user details
  void updateUserInfo({
    String? uid,
    String? userName,
    String? email,
    String? mobile,
    String? address,
    String? city,
    String? state,
    String? pincode,
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
  }) {
    if (uid != null) _userInfo.uid = uid;
    if (userName != null) _userInfo.userName = userName;
    if (email != null) _userInfo.email = email;
    if (mobile != null) _userInfo.mobile = mobile;
    if (address != null) _userInfo.address = address;
    if (city != null) _userInfo.city = city;
    if (state != null) _userInfo.state = state;
    if (pincode != null) _userInfo.pincode = pincode;
    if (planName != null) _userInfo.planName = planName;
    if (planType != null) _userInfo.planType = planType;
    if (planAmount != null) _userInfo.planAmount = planAmount;
    if (dateOfBirth != null) _userInfo.dateOfBirth = dateOfBirth;
    if (accountNumber != null) _userInfo.accountNumber = accountNumber;
    if (reenterAccountNumber != null)
      _userInfo.reenterAccountNumber = reenterAccountNumber;
    if (ifscCode != null) _userInfo.ifscCode = ifscCode;
    if (branch != null) _userInfo.branch = branch;
    if (pan != null) _userInfo.pan = pan;
    if (idProofType != null) _userInfo.idProofType = idProofType;
    if (idProofNumber != null) _userInfo.idProofNumber = idProofNumber;
    if (nomineeName != null) _userInfo.nomineeName = nomineeName;
    if (nomineeRelation != null) _userInfo.nomineeRelation = nomineeRelation;
    if (goldRate != null) _userInfo.goldRate = goldRate;

    notifyListeners();
  }

  void clear() {
    _userInfo = UserInfo(
      uid: '',
      userName: '',
      email: '',
      mobile: '',
      address: '',
      city: '',
      state: '',
      pincode: '',
      country: 'India',
      planName: '',
      planType: '',
      planAmount: 0,
      accountNumber: '',
      reenterAccountNumber: '',
      ifscCode: '',
      branch: '',
      pan: '',
      idProofType: 'Select ID Proof',
      idProofNumber: '',
      nomineeName: '',
      nomineeRelation: '',
      goldRate: 0.0,
    );
    notifyListeners();
  }
}
