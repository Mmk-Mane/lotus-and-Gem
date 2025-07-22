import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lotusandgems/screens/bottomNavigationpage.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/widgets/customappbar.dart';
import 'package:lotusandgems/widgets/customelevatedbutton.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  User? get currentUser => FirebaseAuth.instance.currentUser;
  late Timer _timer;
  bool _isEmailVerified = false;
  bool _emailSent = false;
  bool _loading = false;
  final user = FirebaseAuth.instance.currentUser;



  @override
  void initState() {
    super.initState();

    _sendEmailOnce();

    // Start auto-checking email status every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (_) => _checkEmailVerified());
  }

  Future<void> _sendEmailOnce() async {
    if (!_emailSent) {
      try {
        await currentUser?.sendEmailVerification();
        setState(() => _emailSent = true);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to send verification email: $e")),
        );
      }
    }
  }


  Future<void> _checkEmailVerified() async {
    await currentUser?.reload();
    final isVerified = currentUser?.emailVerified ?? false;

    if (isVerified) {
      _timer.cancel();
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BottomNavigationPage()),
      );
    }
  }

  Future<void> _resendEmail() async {
    try {
      await currentUser?.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Verification email resent.")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        logoAssetPath: MKImg.lgLogo2,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.mark_email_unread, size: 100, color: Colors.orange),
              const SizedBox(height: 20),
              const Text(
                "A verification email has been sent.\nPlease check your inbox.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              CustomElevatedButton(
                label: "Resend Email",
                onPressed: _resendEmail,

              ),
              const SizedBox(height: 12),
              const Text(
                "Once verified, you'll be redirected automatically.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
