import 'package:flutter/material.dart';
import 'package:lotusandgems/data/user_info.dart';

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
    _userInfo = _userInfo.copyWith(
      uid: uid,
      userName: userName,
      email: email,
      mobile: mobile,
      address: address,
      city: city,
      state: state,
      pincode: pincode,
      planName: planName,
      planType: planType,
      planAmount: planAmount,
      dateOfBirth: dateOfBirth,
      accountNumber: accountNumber,
      reenterAccountNumber: reenterAccountNumber,
      ifscCode: ifscCode,
      branch: branch,
      pan: pan,
      idProofType: idProofType,
      idProofNumber: idProofNumber,
      nomineeName: nomineeName,
      nomineeRelation: nomineeRelation,
      goldRate: goldRate,
    );
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
