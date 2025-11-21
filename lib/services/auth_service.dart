// import 'package:firebase_auth/firebase_auth.dart';

// // ignore_for_file: avoid_print
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Stream<User?> get authStateChanges => _auth.authStateChanges();

//   // SIGNUP
//   Future<User?> signUp(String email, String password) async {
//     try {
//       print("🔹 Signing up user: $email");

//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       print("✅ User created: ${result.user?.uid}");
//       return result.user;

//     } on FirebaseAuthException catch (e) {
//       print("❌ Firebase Signup Error: ${e.code}");

//       if (e.code == 'email-already-in-use') {
//         throw "This email is already registered.";
//       } else if (e.code == 'invalid-email') {
//         throw "Invalid email format.";
//       } else if (e.code == 'weak-password') {
//         throw "Password is too weak.";
//       }

//       throw e.message ?? "Signup failed";
//     }
//   }

//   // LOGIN
//   Future<UserCredential> login(String email, String password) async {
//     try {
//       print("🔹 Logging in: $email");

//       return await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//     } on FirebaseAuthException catch (e) {
//       print("❌ Firebase Login Error: ${e.code}");

//       if (e.code == 'user-not-found') {
//         throw "Account does not exist.";
//       } else if (e.code == 'wrong-password') {
//         throw "Incorrect password.";
//       }

//       throw e.message ?? "Login failed";
//     }
//   }

//   // LOGOUT
//   Future<void> logout() async {
//     await _auth.signOut();
//   }
// }

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
