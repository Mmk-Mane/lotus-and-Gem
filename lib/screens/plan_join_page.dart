import 'package:flutter/material.dart';
import 'package:lotusandgems/data/user_info_provider.dart';
import 'package:lotusandgems/screens/planorderconfirm_page.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';
import 'package:lotusandgems/utils/validators/validator.dart';
import 'package:lotusandgems/widgets/custom_text_inputfeild.dart';
import 'package:lotusandgems/widgets/customappbar.dart';
import 'package:lotusandgems/widgets/customelevatedbutton.dart';
import 'package:lotusandgems/widgets/termsandcontionscheckbox.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart'; // Import Ionicons package
import 'package:firebase_auth/firebase_auth.dart';

class CustomPlanJoinPage extends StatefulWidget {
  final String planName;

  CustomPlanJoinPage({super.key, required this.planName});

  @override
  State<CustomPlanJoinPage> createState() => _CustomPlanJoinPageState();
}

class _CustomPlanJoinPageState extends State<CustomPlanJoinPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  TextEditingController _planNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _reenterAccountNumberController =
      TextEditingController();
  final TextEditingController _ifscController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _idProofNumberController =
      TextEditingController();
  final TextEditingController _nomineeNameController = TextEditingController();
  final TextEditingController _nomineeRelationController =
      TextEditingController();

  bool _showAdditionalInfo = false;
  bool _isUserDetailsValid = false;
  String _selectedProofType = "Select ID Proof";
  DateTime? _selectedDateOfBirth;

  void _validateAndMoveNext() {
    if (_amountController.text.isEmpty ||
        (int.tryParse(_amountController.text) ?? 0) < 500) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Amount must be at least 500")));
      return;
    }
    setState(() {
      _showAdditionalInfo = true;
    });
  }

  void _checkUserDetailsValidity() {
    // Check if all required fields are filled in the User Details section
    setState(() {
      _isUserDetailsValid = _userNameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _mobileController.text.isNotEmpty &&
          _addressController.text.isNotEmpty &&
          _cityController.text.isNotEmpty &&
          _stateController.text.isNotEmpty &&
          _pincodeController.text.isNotEmpty;
    });
  }

  Future<void> _selectDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDateOfBirth) {
      setState(() {
        _selectedDateOfBirth = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _countryController = TextEditingController(text: "India");


    _planNameController = TextEditingController(text: widget.planName);
    final userInfoProvider =
        Provider.of<UserInfoProvider>(context, listen: false);
    userInfoProvider.updateUserInfo(planName: widget.planName);
  }

  @override
  void dispose() {
    _planNameController.dispose();
    _amountController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _pincodeController.dispose();
    _accountNumberController.dispose();
    _reenterAccountNumberController.dispose();
    _ifscController.dispose();
    _branchController.dispose();
    _panController.dispose();
    _idProofNumberController.dispose();
    _nomineeNameController.dispose();
    _nomineeRelationController.dispose();
    super.dispose();
  }

  void _saveUserDataToProvider() {
    final userInfoProvider =
        Provider.of<UserInfoProvider>(context, listen: false);
    final firebaseUser = FirebaseAuth.instance.currentUser;

    //cheking the user already login
    if (firebaseUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User not logged in. Please login again.")),
      );
      return;
    }


    // Update the provider with the form data
    userInfoProvider.updateUserInfo(
      uid: firebaseUser.uid,
      planAmount: int.tryParse(_amountController.text) ?? 0,
      planName: _planNameController.text,
      planType: _planNameController.text == "Lakshmi Dhan Varsha" ? "AB" : "WB",
      userName: _userNameController.text,
      email: _emailController.text,
      mobile: _mobileController.text,
      address: _addressController.text,
      city: _cityController.text,
      state: _stateController.text,
      pincode: _pincodeController.text,
      accountNumber: _accountNumberController.text,
      reenterAccountNumber: _reenterAccountNumberController.text,
      ifscCode: _ifscController.text,
      branch: _branchController.text,
      pan: _panController.text,
      idProofNumber: _idProofNumberController.text,
      nomineeName: _nomineeNameController.text,
      nomineeRelation: _nomineeRelationController.text,
      idProofType: _selectedProofType,
      dateOfBirth: _selectedDateOfBirth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  CustomAppBar(
          logoAssetPath: MKImg.lgLogo2,
        ),
        floatingActionButton: _showAdditionalInfo
            ? null // Hide the FloatingActionButton when moving to the next section
            : FloatingActionButton(
                onPressed: _isUserDetailsValid
                    ? () {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          _validateAndMoveNext();
                        }
                      }
                    : () {
                        // Show a SnackBar when the button is pressed in disabled state
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill in all required data"),
                            backgroundColor: MKColors.warning,
                          ),
                        );
                      },
                backgroundColor: _isUserDetailsValid
                    ? MKColors.primary
                    : MKColors.grey, // Dynamic color
                child: const Icon(Icons.arrow_forward),
              ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Plan Details",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: MKSizes.md),
                CustomTextInputField(
                  title: "Plan Name",
                  controller: _planNameController,
                  icon: Ionicons.document_text_outline,
                  enabled: false,
                ),
                const SizedBox(height: MKSizes.md),
                CustomTextInputField(
                  title: "Plan Amount",
                  icon: Ionicons.cash_outline, // Replace Material icon
                  controller: _amountController,
                  isNumeric: true,
                  validator: Validator.validateAmount,
                ),
                const SizedBox(height: MKSizes.lg),
                // First section: User Details
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: _showAdditionalInfo
                      ? Container() // Empty container when switching to Additional Information
                      : Column(
                          key: ValueKey('UserDetails'),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "User Details",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "Name",
                              icon: Ionicons
                                  .person_outline, // Replace Material icon
                              controller: _userNameController,
                              onChanged: (_) => _checkUserDetailsValidity(),
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "Email",
                              icon: Ionicons
                                  .mail_outline, // Replace Material icon
                              controller: _emailController,
                              onChanged: (_) => _checkUserDetailsValidity(),
                              validator: Validator
                                  .validateEmail, // Add your email validator
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "Mobile",
                              icon: Ionicons.phone_portrait_outline,
                              controller: _mobileController,
                              isNumeric: true,
                              maxLength: 10,
                              validator: Validator
                                  .validateMobile, // Add your mobile validator
                              onChanged: (_) => _checkUserDetailsValidity(),
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "Address",
                              icon: Ionicons.location_outline,
                              controller: _addressController,
                              onChanged: (_) => _checkUserDetailsValidity(),
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "City",
                              icon: Ionicons.business_outline,
                              controller: _cityController,
                              onChanged: (_) => _checkUserDetailsValidity(),
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "State",
                              icon: Ionicons
                                  .location_outline, // Correct Ionicon for State
                              controller: _stateController,
                              onChanged: (_) => _checkUserDetailsValidity(),
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "Pincode",
                              icon: Icons.pin_drop,
                              controller: _pincodeController,
                              isNumeric: true,
                              maxLength: 6,
                              validator: Validator.validatePincode,
                              onChanged: (_) => _checkUserDetailsValidity(),
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "Country",
                              controller: _countryController,
                              enabled: false,
                            ),
                            const SizedBox(height: MKSizes.lg),
                          ],
                        ),
                ),

                // Second Section: Additional Information
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: _showAdditionalInfo
                      ? Column(
                          key: ValueKey('AdditionalInfo'),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Additional Information",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "Date of Birth",
                              icon: Ionicons.calendar_outline,
                              controller: TextEditingController(
                                  text: _selectedDateOfBirth != null
                                      ? "${_selectedDateOfBirth?.toLocal()}"
                                          .split(' ')[0]
                                      : "Select Date"),
                              enabled: false,
                              onTap: () => _selectDateOfBirth(context),
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "Account Number",
                              isNumeric: true,
                              maxLength: 16,
                              validator: Validator.validateAccountNumber,
                              icon: Ionicons
                                  .card_outline, // Use appropriate Ionicon
                              controller: _accountNumberController,
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "Re-enter Account Number",
                              icon: Ionicons.card_outline,
                              maxLength: 16,
                              isNumeric: true, // Use appropriate Ionicon
                              controller: _reenterAccountNumberController,
                              validator: Validator.validateAccountNumber,
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "IFSC Code",
                              icon: Ionicons
                                  .code_outline, // Use appropriate Ionicon
                              controller: _ifscController,
                              validator: Validator.validateIFSCCode,
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "Bank Name",
                              icon: Ionicons.build_outline, // Ionicon for Bank
                              controller: _branchController,
                              validator: Validator.validateBankName,
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "PAN Number",
                              icon:
                                  Ionicons.card_outline, // Ionicon for PAN card
                              controller: _panController,
                              //validator: Validator.validatePAN,
                            ),
                            const SizedBox(height: MKSizes.md),
                            // ID Proof Type Dropdown
                            DropdownButtonFormField<String>(
                              value: _selectedProofType,
                              items: [
                                "Select ID Proof",
                                "Driving License",
                                "Voter ID",
                                "Passport",
                                "Aadhar Number",
                                "Ration Card",
                              ]
                                  .map((proofType) => DropdownMenuItem(
                                        value: proofType,
                                        child: Text(proofType),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedProofType = value!;
                                });
                              },
                              decoration: const InputDecoration(
                                labelText: "Identity Proof Type",
                              ),
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "ID Proof Number",
                              icon: Ionicons.document_text_outline,
                              controller: _idProofNumberController,
                              isNumeric: true,
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "Nominee Name",
                              icon: Ionicons.person_outline,
                              controller: _nomineeNameController,
                              validator: Validator.validateNomineeName,
                            ),
                            const SizedBox(height: MKSizes.md),
                            CustomTextInputField(
                              title: "Nominee Relation",
                              icon: Ionicons.people_outline,
                              controller: _nomineeRelationController,
                              validator: Validator.validateNomineeRelation,
                            ),
                            const SizedBox(
                              height: MKSizes.spaceBtwItems,
                            ),
                            TermsAndConditionsCheckbox(
                              onChanged: (bool isChecked) {
                                print("Checkbox value: $isChecked");
                              },
                            ),
                            Center(
                              child: CustomElevatedButton(
                                label: "Proceed",
                                onPressed: () {
                                  // Validate the form before proceeding
                                  if (_formKey.currentState != null &&
                                      _formKey.currentState!.validate()) {
                                    // Form is valid, save user data to provider
                                    _saveUserDataToProvider();

                                    // Navigate to the confirmation page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PlanOrderConfirmationPage(),
                                      ),
                                    );

                                    // Optionally show a success message
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Data saved successfully!")),
                                    );
                                  } else {
                                    // Show an error message if the form is invalid
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Please complete all fields correctly")),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      : Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
