import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kidoo/controllers/auth_gate.dart';
import 'package:kidoo/services/user_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("🔥 Firebase Init Error: $e");
  }

  // ✅ Register UserController BEFORE using AuthGate
  Get.put(UserController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kidoo App",
      theme: ThemeData(primarySwatch: Colors.blue),

      /// 👇 AuthGate decides where to go
      home: AuthGate(),
    );
  }
}
