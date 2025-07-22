import 'package:flutter/material.dart';

class CustomTextInputField extends StatelessWidget {
  final String title;
  final IconData? icon; // Optional icon
  final TextEditingController controller;
  final bool isNumeric; // Determines if the input is numeric
  final bool enabled; // Optional parameter to control if the field is enabled
  final String? Function(String?)? validator; // Optional validator for the field
  final VoidCallback? onTap; // Optional onTap callback for custom behavior like showing a date picker
  final Function(String)? onChanged; // Optional callback to handle changes in the text field
  final int? maxLength; // New: Maximum character limit for input

  const CustomTextInputField({
    super.key,
    required this.title,
    this.icon, // Icon is now optional
    required this.controller,
    this.isNumeric = false, // Default value is false (text input)
    this.enabled = true, // Default value is true
    this.validator, // Optional validator
    this.onTap, // Optional onTap callback
    this.onChanged, // Optional onChanged callback
    this.maxLength, // Optional max length
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger onTap if provided
      child: AbsorbPointer(
        absorbing: onTap != null, // Prevent typing when onTap is defined
        child: TextFormField(
          controller: controller,
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text, // Conditional keyboard type
          enabled: enabled, // Use the enabled property to control field state
          validator: validator, // Apply custom validator if provided
          onChanged: onChanged, // Trigger the onChanged callback when the text changes
          maxLength: maxLength, // Enforces character limit if provided
          decoration: InputDecoration(
            labelText: title, // Use the provided title
            prefixIcon: icon != null ? Icon(icon) : null, // Add icon only if it's provided
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            counterText: "", // Hides the default character counter
          ),
        ),
      ),
    );
  }
}
