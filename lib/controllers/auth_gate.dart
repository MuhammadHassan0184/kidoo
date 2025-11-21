import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/user_controller.dart';
import '../screens/auth/login_screen.dart';
import '../screens/kidoo/main_manue.dart';

class AuthGate extends StatelessWidget {
  AuthGate({super.key});

  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData) {
          userController.clearUser();
          return LoginScreen();
        }

        return FutureBuilder(
          future: userController.fetchUserFromFirestore(snapshot.data!.uid),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            return const MainManue();
          },
        );
      },
    );
  }
}
