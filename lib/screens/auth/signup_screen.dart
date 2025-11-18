import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/controllers/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  final SignupController controller = SignupController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff6fa3ff),
              Color(0xff4b8dfc),
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
                        "Create Account ✨",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text("Sign up to get started"),
                      const SizedBox(height: 30),
                      TextFormField(
  controller: controller.fullNameController,
  decoration: InputDecoration(
    labelText: 'Full Name',
    prefixIcon: const Icon(Icons.person),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),
const SizedBox(height: 18),

TextFormField(
  controller: controller.countryController,
  decoration: InputDecoration(
    labelText: 'Country',
    prefixIcon: const Icon(Icons.flag),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),
const SizedBox(height: 18),

DropdownButtonFormField<String>(
  // ignore: deprecated_member_use
  value: controller.selectedRole,
  decoration: InputDecoration(
    labelText: "Select Role",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  items: const [
    DropdownMenuItem(value: "admin", child: Text("Admin")),
    DropdownMenuItem(value: "user", child: Text("User")),
  ],
  onChanged: (value) {
    controller.selectedRole = value!;
  },
),
const SizedBox(height: 18),
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
const SizedBox(height: 18),


                      const SizedBox(height: 24),

                      // FIX: call signup()
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            controller.signup(context);
                          },
                          style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                          child: const Text("Sign Up", style: TextStyle(fontSize: 16)),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Center(
                        child: TextButton(
                          onPressed: () => Get.toNamed("/LoginScreen"),
                          child: const Text("Already have an account? Login"),
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

