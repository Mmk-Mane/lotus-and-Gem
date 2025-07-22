import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomPasswordTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator; // Optional validator for password field

  const CustomPasswordTextField({
    super.key,
    required this.title,
    required this.controller,
    this.validator, // Optional password validator
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _isObscured = true; // Controls password visibility

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscured, // Toggle visibility
      validator: widget.validator, // Use passed validator
      decoration: InputDecoration(
        labelText: widget.title,
        prefixIcon: const Icon(Ionicons.lock_open_outline),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscured ? Ionicons.eye_off_outline: Ionicons.eye_outline,
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
