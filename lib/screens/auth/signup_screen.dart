// ignore_for_file: deprecated_member_use
import 'package:kidoo/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  final SignupController controller = SignupController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B0B0B),
      body: Stack(
        children: [
          // Background glow
          Positioned(
            top: -120,
            left: -120,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff2ebf91).withOpacity(0.25),
              ),
            ),
          ),

          Positioned(
            bottom: -120,
            right: -120,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff8360c3).withOpacity(0.25),
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff141414),
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.06),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 34),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 0.6,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Create your account",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(height: 32),

                        _field(
                          controller: controller.fullNameController,
                          hint: "Full Name",
                          icon: Icons.person_outline,
                        ),

                        SizedBox(height: 18),

                        _field(
                          controller: controller.countryController,
                          hint: "Country",
                          icon: Icons.public,
                        ),

                        SizedBox(height: 18),

                        DropdownButtonFormField<String>(
                          value: controller.selectedRole,
                          dropdownColor: Color(0xff1C1C1C),
                          decoration: _dropdownStyle("Role"),
                          style: TextStyle(color: Colors.white),
                          items: [
                            DropdownMenuItem(
                              value: "admin",
                              child: Text("Admin", style: TextStyle(color: Colors.white)),
                            ),
                            DropdownMenuItem(
                              value: "user",
                              child: Text("User", style: TextStyle(color: Colors.white)),
                            ),
                          ],
                          onChanged: (value) {
                            controller.selectedRole = value!;
                          },
                        ),

                        SizedBox(height: 18),

                        _field(
                          controller: controller.emailController,
                          hint: "Email Address",
                          icon: Icons.alternate_email,
                        ),

                        SizedBox(height: 18),

                        _field(
                          controller: controller.passwordController,
                          hint: "Password",
                          icon: Icons.lock_outline,
                          obscure: true,
                        ),

                        SizedBox(height: 34),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.signup(context);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 18),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              "CREATE ACCOUNT",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 26),

                        Center(
                          child: GestureDetector(
                            onTap: () => Get.toNamed("/LoginScreen"),
                            child: Text(
                              "Already have an account? Login",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- FIELD STYLE ----------------
  Widget _field({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        prefixIcon: Icon(icon, color: Colors.grey.shade600),
        filled: true,
        fillColor: Color(0xff1C1C1C),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ---------------- DROPDOWN STYLE ----------------
  InputDecoration _dropdownStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade600),
      filled: true,
      fillColor: Color(0xff1C1C1C),
      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
    );
  }
}
