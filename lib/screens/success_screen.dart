import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lotusandgems/screens/bottomNavigationpage.dart'; // or transaction screen
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  bool _showButton = false;



  @override
  void initState() {
    super.initState();

    // Delay button appearance
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _showButton = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MKColors.primaryBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie Animation
            SizedBox(
              height: 280,
              child: Lottie.asset(
                "assets/images/animations/Sucesso.json",
                repeat: false,
              ),
            ),
            const SizedBox(height: MKSizes.md),

            Text(
              "Welcome to the\n Lotus & Gems Family!",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: MKColors.textPrimary,

                  ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // 🎉 OK Button (shown after delay)
            // Show spinner first, then button
            _showButton
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BottomNavigationPage(),
                        ),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MKColors.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    child: const Text(
                      "🎉 OK, Got it!",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                : const CircularProgressIndicator(color: MKColors.primary),
          ],
        ),
      ),
    );
  }
}
