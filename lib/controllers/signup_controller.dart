import 'package:kidoo/screens/kidoo/main_manue.dart';
import 'package:kidoo/services/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:get/get.dart';

class SignupController {
  final AuthService _authService = AuthService();

  final userController = Get.find<UserController>(); // <── ADDED HERE

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final countryController = TextEditingController();
 
  String selectedRole = "admin";

  bool isLoading = false;

  Future<void> signup(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final fullName = fullNameController.text.trim();
    final country = countryController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        fullName.isEmpty ||
        country.isEmpty) {
      _showSnack(context, "Please fill all fields.");
      return;
    }

    try {
      isLoading = true;

      User? user = await _authService.signUp(
        email,
        password,
        fullName,
        country,
        selectedRole,
      );

      isLoading = false;

      if (user != null) {
        // ignore: use_build_context_synchronously
        _showSnack(context, "Signup successful!");

        //  SAVE ROLE HERE
        userController.role.value = selectedRole;

        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (_) => const MainManue()),
        );
      } else {
        // ignore: use_build_context_synchronously
        _showSnack(context, "Signup failed. Please try again.");
      }
    } catch (e) {
      isLoading = false;
      // ignore: use_build_context_synchronously
      _showSnack(context, e.toString());
    }
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
