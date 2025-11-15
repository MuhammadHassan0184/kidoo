// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:get/instance_manager.dart';
// import '../../services/auth_service.dart';
// import 'home_screen.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final AuthService _auth = AuthService();
//   // ignore: unused_field
//   bool _loading = false;

//   // ignore: unused_element
//   Future<void> _signUp(dynamic _fullNameController) async {
//     setState(() => _loading = true);

//     try {
//      final user = await _auth.signUp(
//   _fullNameController.text.trim(),
//   _emailController.text.trim(),
//   _passwordController.text.trim(),
// );



//       setState(() => _loading = false);

//       if (user != null && mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const HomeScreen()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('❌ Sign up failed — user is null')),
//         );
//       }
//     } catch (e) {
//       setState(() => _loading = false);
//       print('❌ Firebase sign up error: $e'); // Terminal output
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('❌ Sign up failed: $e')), // Show error in app
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//   body: Container(
//     decoration: const BoxDecoration(
//       gradient: LinearGradient(
//         colors: [
//           Color(0xff6fa3ff),
//           Color(0xff4b8dfc),
//         ],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ),
//     ),
//     child: Center(
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(22.0),
//           child: Card(
//             elevation: 8,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Title
//                   Text(
//                     "Create Account ✨",
//                     style: Theme.of(context)
//                         .textTheme
//                         .headlineMedium
//                         ?.copyWith(fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     "Sign up to get started",
//                     style: Theme.of(context).textTheme.bodyMedium,
//                   ),
//                   const SizedBox(height: 30),

//                   // Email Field
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       prefixIcon: const Icon(Icons.email_rounded),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   const SizedBox(height: 18),

//                   // Password Field
//                   TextFormField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       prefixIcon: const Icon(Icons.lock_rounded),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // Signup Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: FilledButton(
//                       onPressed: ()  {
                        
//                       },
//                       style: FilledButton.styleFrom(
//                         padding:
//                             const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: const Text(
//                         "Sign Up",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // Go to Login
//                   Center(
//                     child: TextButton(
//               onPressed: () {
//                 Get.toNamed("/LoginScreen");
//               },
//               child: const Text('Already have an account? Login'),
//             ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   ),
// );

//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
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

                      // 👉 EMAIL FIELD (CONNECTED)
                      TextFormField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 18),

                      // 👉 PASSWORD FIELD (CONNECTED)
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

                      // 👉 SIGNUP BUTTON (WORKING)
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            Get.toNamed("/MainManue");
                          },
                          style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Center(
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed("/LoginScreen");
                          },
                          child: const Text('Already have an account? Login'),
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



// Scaffold(
//       appBar: AppBar(title: Text("Signup")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: controller.emailController,
//               decoration: InputDecoration(labelText: "Email"),
//             ),

//             SizedBox(height: 16),

//             TextField(
//               controller: controller.passwordController,
//               decoration: InputDecoration(labelText: "Password"),
//               obscureText: true,
//             ),

//             SizedBox(height: 30),

//             ElevatedButton(
//               onPressed: () => controller.signup(context),
//               child: Text("Signup"),
//             )
//           ],
//         ),
//       ),
//     );

