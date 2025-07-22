import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';

class TermsAndConditionsCheckbox extends StatefulWidget {
  final ValueChanged<bool> onChanged; // Callback when checkbox value changes

  const TermsAndConditionsCheckbox({super.key, required this.onChanged});

  @override
  _TermsAndConditionsCheckboxState createState() =>
      _TermsAndConditionsCheckboxState();
}

class _TermsAndConditionsCheckboxState
    extends State<TermsAndConditionsCheckbox> {
  bool _isAgreed = false; // Tracks if terms are agreed
  bool _isChecked = false; // Tracks checkbox state

  void _openTermsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Terms & Conditions",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "1. You must comply with all applicable laws.\n"
                      "2. The services provided are subject to our terms.\n"
                      "3. We reserve the right to modify the terms at any time.\n"
                      "4. Your data will be processed in accordance with our privacy policy.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isAgreed = true; // Enable the checkbox
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Agree", style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleCheckboxChange(bool? newValue) {
    if (!_isAgreed) {
      // Show SnackBar to notify user they need to agree first
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please agree to the Terms & Conditions"),
          backgroundColor: MKColors.warning,
        ),
      );
    } else {
      setState(() {
        _isChecked = newValue ?? false;
      });
      widget.onChanged(_isChecked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: _handleCheckboxChange, // Handle checkbox change
        ),
        Text(
          "I agree to the",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(width: MKSizes.spaceBtwItems - 10),
        GestureDetector(
          onTap: _openTermsDialog,
          child: Text(
            "Terms & Conditions",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
