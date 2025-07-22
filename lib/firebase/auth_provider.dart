import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;
  String? errorMessage;

  User? get currentUser => _auth.currentUser;

  // Sign up
  Future<bool> signUpWithEmail(String email, String password, BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      await _auth.createUserWithEmailAndPassword(email: email, password: password);

      isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      errorMessage = e.message;
      notifyListeners();
      _showErrorDialog(context, errorMessage ?? "Signup failed");
      return false;
    }
  }

  // Login
  Future<bool> loginWithEmail(String email, String password, BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      errorMessage = e.message;
      notifyListeners();
      _showErrorDialog(context, errorMessage ?? "Login failed");
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }

  // Show error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}
