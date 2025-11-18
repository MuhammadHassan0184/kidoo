import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kidoo/Config/routes/routes.dart';
import 'package:kidoo/screens/kidoo/main_manue.dart';
import 'package:kidoo/services/user_controller.dart'; 
import 'screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(UserController()); // register globally
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final AuthService _auth = AuthService();

    return GetMaterialApp(
      title: 'Kidoo Firebase Auth',
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: _auth.authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasData) {
            return const MainManue();
            // return const  Home();
          } else {
            return  LoginScreen();
            // return  Home();
          }
        },
      ),
      getPages: AppRoutes.routes(),
    );
  }
}
