import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kidoo/services/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final UserController userController = Get.find<UserController>();

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // SIGNUP
  Future<User?> signUp(
    String email,
    String password,
    String fullName,
    String country,
    String role,
  ) async {
    try {
      UserCredential result =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);

      User? user = result.user;

      if (user != null) {
        await _db.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "fullName": fullName,
          "email": email,
          "country": country,
          "role": role,
          "createdAt": DateTime.now(),
        });

        /// Update UserController
        userController.setUser(
          uid: user.uid,
          fullName: fullName,
          email: email,
          country: country,
          role: role,
        );

        // ignore: avoid_print
        print("✅ User saved in Firestore: ${user.uid}");
      }

      return user;
    } catch (e) {
      // ignore: avoid_print
      print("❌ Error: $e");
      return null;
    }
  }

  // LOGIN
  Future<UserCredential> login(String email, String password) async {
    try {
      // ignore: avoid_print
      print("🔹 Logging in: $email");

      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// fetch user role + profile
      DocumentSnapshot snapshot =
          await _db.collection("users").doc(result.user!.uid).get();

      if (snapshot.exists) {
        userController.setUser(
          uid: result.user!.uid,
          fullName: snapshot["fullName"],
          email: snapshot["email"],
          country: snapshot["country"],
          role: snapshot["role"],
        );
      }

      return result;
    } catch (e) {
      // ignore: avoid_print
      print("❌ Login Error: $e");
      rethrow;
    }
  }

  // LOGOUT
Future<void> logout() async {
  // ignore: avoid_print
  print("🔹 Logging out user...");

  await _auth.signOut();

  userController.clearUser();

  // ignore: avoid_print
  print("✅ User logged out & UserController cleared");
}
}
