import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = LoginController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff4b8dfc),
              Color(0xff6fa3ff),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30, horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back 👋",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text("Login to continue"),
                      const SizedBox(height: 30),

                      // FIX: email controller added
                      TextFormField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // FIX: password controller added
                      TextFormField(
                        controller: controller.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // FIX: login correctly calls controller.login()
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            controller.login(context);
                          },
                          style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                          child: const Text("Login", style: TextStyle(fontSize: 16)),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Center(
                        child: TextButton(
                          onPressed: () => Get.toNamed("/SignupScreen"),
                          child: const Text("Don’t have an account? Sign Up"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
