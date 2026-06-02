import 'package:flutter/material.dart';
import 'package:lotusandgems/firebase/auth_provider.dart';
import 'package:lotusandgems/screens/email_verification_screen.dart';
import 'package:lotusandgems/screens/login_page.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';
import 'package:lotusandgems/widgets/custom_passwordtextfield.dart';
import 'package:lotusandgems/widgets/custom_text_inputfeild.dart';
import 'package:lotusandgems/widgets/customelevatedbutton.dart';

import 'package:lotusandgems/widgets/termsandcontionscheckbox.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _agreed = false;
  bool _isLoading = false;

  void _submitSignup() async {
    if (!_formKey.currentState!.validate() || !_agreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please complete form & agree to terms")),
      );
      return;
    }

    if (_passwordController.text != _confirmpasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    setState(() => _isLoading = true);

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final result = await authProvider.signUpWithEmail(
       _emailController.text.trim(),
       _passwordController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const EmailVerificationScreen()),
      );
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage ?? "Signup failed"),
            backgroundColor: MKColors.error,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Access the ThemeData
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: MKColors.primaryBackground,
      body: Stack(
        children: [
          // Background with curved design
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    MKImg.model6,
                  ),
                  fit: BoxFit.cover,
                ),
                // color: MKColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(300),
                  bottomRight: Radius.circular(300),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                color: MKColors.primary.withOpacity(0.3), // 60% opacity
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(300),
                  bottomRight: Radius.circular(300),
                ),
              ),
              child: Container(),
            ),
          ),
          Positioned(
            top: 280,
            left: 20,
            right: 20,
            bottom: 30,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: MKColors.primaryBackground,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: theme.shadowColor.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: Column(
                      children: [
                        Text(
                          "Create Account",
                          style: textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: MKSizes.spaceBtwItems,
                        ),
                        Text(
                          "Enter your email and password",
                          style: textTheme.titleSmall,
                        ),
                        SizedBox(
                          height: MKSizes.spaceBtwItems,
                        ),
                        CustomTextInputField(
                          title: "User Name",
                          icon: Icons.account_box,
                          controller: _nameController,
                        ),
                        SizedBox(
                          height: MKSizes.spaceBtwItems,
                        ),
                        CustomTextInputField(
                          title: "Email ID",
                          icon: Icons.email_outlined,
                          controller: _emailController,
                          isNumeric: false,
                        ),
                        SizedBox(
                          height: MKSizes.spaceBtwItems,
                        ),
                        CustomPasswordTextField(
                          title: "Password",
                          controller: _passwordController,
                        ),
                        SizedBox(
                          height: MKSizes.spaceBtwItems,
                        ),
                        CustomPasswordTextField(
                          title: "Confirm Password",
                          controller: _confirmpasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MKSizes.spaceBtwItems,
                        ),
                        TermsAndConditionsCheckbox(
                          onChanged: (bool isChecked) {
                            setState(() {
                              _agreed = true;
                            });
                          },
                        ),
                        SizedBox(
                          height: MKSizes.spaceBtwItems - 10,
                        ),
                        _isLoading
                            ? const CircularProgressIndicator()
                            : CustomElevatedButton(
                          label: "Create Account",
                          onPressed: _submitSignup,
                        ),
                        SizedBox(
                          height: MKSizes.spaceBtwItems - 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "You have an account?",
                              style: textTheme.bodySmall,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginScreen(), // Corrected the method name and syntax
                                  ),
                                );
                              },
                              child: Text("Login", style: textTheme.bodyMedium),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Login Form
          ),
        ],
      ),
    );
  }
}
