import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lotusandgems/firebase/auth_provider.dart' as myAuth;
import 'package:lotusandgems/screens/bottomNavigationpage.dart';
import 'package:lotusandgems/screens/email_verification_screen.dart';
import 'package:lotusandgems/screens/signup_page.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';
import 'package:lotusandgems/utils/validators/validator.dart';
import 'package:lotusandgems/widgets/custom_passwordtextfield.dart';
import 'package:lotusandgems/widgets/custom_text_inputfeild.dart';
import 'package:lotusandgems/widgets/customcheckbox.dart';
import 'package:lotusandgems/widgets/customelevatedbutton.dart';
import 'package:lotusandgems/widgets/socialbutton.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false; // Add state for 'Remember me'
  bool _isPasswordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    final authProvider = Provider.of<myAuth.AuthProvider>(context, listen: false);
    final email = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    final success = await authProvider.loginWithEmail(email, password);

    if (success) {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null && user.emailVerified) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const BottomNavigationPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const EmailVerificationScreen()),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage ?? "Login failed"),
            backgroundColor: MKColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: MKColors.primaryBackground,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(MKImg.model6),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(300),
                  bottomRight: Radius.circular(300),
                ),
              ),
            ),
          ),
          Positioned(
            top: 280,
            left: 20,
            right: 20,
            bottom: 60,
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
                child: Consumer<myAuth.AuthProvider>(
                  builder: (context, authProvider, child) {
                  return Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Column(
                        children: [
                          Text(
                            "Welcome back!",
                            style: textTheme.headlineLarge,
                          ),
                          SizedBox(
                            height: MKSizes.spaceBtwItems,
                          ),
                          Text(
                            "Sign in to your account",
                            style: textTheme.titleSmall,
                          ),
                          SizedBox(
                            height: MKSizes.defaultSpace,
                          ),
                          CustomTextInputField(
                            title: "User Name",
                            icon: Ionicons.mail_outline,
                            controller: _usernameController,
                            isNumeric: false,
                            validator: Validator.validateEmail,
                          ),
                          SizedBox(
                            height: MKSizes.defaultSpace,
                          ),
                          CustomPasswordTextField(
                            title: "Password",
                            controller: _passwordController,
                            validator: Validator.validatePassword,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomCheckbox(
                                label: "Remember me",
                                initialValue: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = true;
                                  });
                                },
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: MKColors.error,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MKSizes.defaultSpace,
                          ),
                          CustomElevatedButton(
                            label: "Login",
                            onPressed: _login,
                          ),
                          SizedBox(
                            height: MKSizes.spaceBtwItems,
                          ),
                          const Center(child: Text('- OR -')),
                          SizedBox(
                            height: MKSizes.spaceBtwItems - 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SocialImageButton(
                                  assetImagePath: MKImg.glogo, onPressed: () {}),
                              SizedBox(
                                width: MKSizes.spaceBtwItems,
                              ),
                              SocialImageButton(
                                  assetImagePath: MKImg.fblogo, onPressed: () {}),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Don’t have an account?",
                                style: textTheme.bodySmall,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Create",
                                  style: textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );}

                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
