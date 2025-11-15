import 'package:flutter/material.dart';
import 'package:kidoo/view/main_manue.dart';
import '../services/auth_service.dart';
// ignore_for_file: avoid_print



import 'package:firebase_auth/firebase_auth.dart';

class SignupController {
  final AuthService _authService = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> signup(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnack(context, "Please fill all fields.");
      return;
    }

    try {
      isLoading = true;
      print("🔹 Starting signup process...");

      User? user = await _authService.signUp(email, password);
      isLoading = false;

      if (user != null) {
        print("✅ Signup successful: ${user.email}");
        // ignore: use_build_context_synchronously
        _showSnack(context, "Signup successful!");

        // 👉 DIRECT NAVIGATION TO HOME SCREEN
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (_) => const MainManue()),
        );
      } else {
        // ignore: use_build_context_synchronously
        _showSnack(context, "Signup failed. Please try again.");
      }

    } on FirebaseAuthException catch (e) {
      isLoading = false;
      // ignore: use_build_context_synchronously
      _showSnack(context, e.message ?? "Error occurred.");
    } catch (e) {
      isLoading = false;
      // ignore: use_build_context_synchronously
      _showSnack(context, "Something went wrong: $e");
    }
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

