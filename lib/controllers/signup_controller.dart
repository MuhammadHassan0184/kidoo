// import 'package:flutter/material.dart';
// import 'package:kidoo/screens/kidoo/main_manue.dart';
// import '../services/auth_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';


// class SignupController {
//   final AuthService _authService = AuthService();

//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   // 👉 FIX: These must be REAL controllers, not null
//   final fullNameController = TextEditingController();
//   final countryController = TextEditingController();
//   String selectedRole = "user";

//   bool isLoading = false;

//   Future<void> signup(BuildContext context) async {
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();
//     final fullName = fullNameController.text.trim();
//     final country = countryController.text.trim();

//     if (email.isEmpty ||
//         password.isEmpty ||
//         fullName.isEmpty ||
//         country.isEmpty) {
//       _showSnack(context, "Please fill all fields.");
//       return;
//     }

//     try {
//       isLoading = true;

//       User? user = await _authService.signUp(
//         email,
//         password,
//         fullName,
//         country,
//         selectedRole, // user/admin
//       );

//       isLoading = false;

//       if (user != null) {
//         _showSnack(context, "Signup successful!");

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const MainManue()),
//         );
//       } else {
//         _showSnack(context, "Signup failed. Please try again.");
//       }
//     } catch (e) {
//       isLoading = false;
//       _showSnack(context, e.toString());
//     }
//   }

//   void _showSnack(BuildContext context, String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
//   }
// }


import 'package:flutter/material.dart';
import 'package:kidoo/screens/kidoo/main_manue.dart';
import 'package:kidoo/services/user_controller.dart';
import '../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class SignupController {
  final AuthService _authService = AuthService();

  final userController = Get.find<UserController>(); // <── ADDED HERE

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final countryController = TextEditingController();

  String selectedRole = "user";

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
        _showSnack(context, "Signup successful!");

        // ⭐ SAVE ROLE HERE
        userController.role.value = selectedRole;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainManue()),
        );
      } else {
        _showSnack(context, "Signup failed. Please try again.");
      }
    } catch (e) {
      isLoading = false;
      _showSnack(context, e.toString());
    }
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
