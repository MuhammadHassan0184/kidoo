import 'package:firebase_auth/firebase_auth.dart';

// ignore_for_file: avoid_print


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?>? get authStateChanges => null;

  // ================================
  // SIGNUP (Email + Password only)
  // ================================
  Future<User?> signUp(String email, String password) async {
    try {
      print("🔹 Signing up user: $email");

      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("✅ User created: ${result.user?.uid}");
      return result.user;

    } on FirebaseAuthException catch (e) {
      print("❌ Firebase Signup Error: ${e.code}");

      if (e.code == 'email-already-in-use') {
        throw "This email is already registered.";
      } else if (e.code == 'invalid-email') {
        throw "Invalid email format.";
      } else if (e.code == 'weak-password') {
        throw "Password is too weak.";
      }

      throw e.message ?? "Signup failed";
    }
  }

  // ================================
  // LOGIN (Email + Password only)
  // ================================
  Future<UserCredential> login(String email, String password) async {
    try {
      print("🔹 Logging in: $email");

      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      print("❌ Firebase Login Error: ${e.code}");

      if (e.code == 'user-not-found') {
        throw "Account does not exist.";
      } else if (e.code == 'wrong-password') {
        throw "Incorrect password.";
      }

      throw e.message ?? "Login failed";
    }
  }

  // ================================
  // LOGOUT
  // ================================
  Future<void> logout() async {
    await _auth.signOut();
  }
}



// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Stream<User?>? get authStateChanges => null;

//   // SIGN UP
//   Future<User?> signUp(String fullName, String email, String password) async {
//     try {
//       print("🔹 Attempting signup for $email");

//       // Create Firebase Auth user
//       final credential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       final user = credential.user;

//       if (user != null) {
//         // Save user data to Firestore
//         await _firestore.collection('users').doc(user.uid).set({
//           'uid': user.uid,
//           'name': fullName,
//           'email': email,
//           'createdAt': FieldValue.serverTimestamp(),
//         });

//         print("✅ User saved in Firestore: ${user.uid}");
//       }

//       return user;
//     } catch (e) {
//       print("❌ Signup Error: $e");
//       rethrow;
//     }
//   }

//   // LOGIN
//   Future<UserCredential> login(String email, String password) async {
//     try {
//       return await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } catch (e) {
//       print("❌ Login Error: $e");
//       rethrow;
//     }
//   }

//   // LOGOUT
//   Future<void> logout() async {
//     await _auth.signOut();
//   }
// }





// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // 🔹 Signup (with full name, email, password)
//   Future<User?> signUp(String fullName, String email, String password) async {
//     try {
//       print("🔹 Attempting signup for $email");
//       final credential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       final user = credential.user;

//       if (user != null) {
//         await _firestore.collection('users').doc(user.uid).set({
//           'uid': user.uid,
//           'name': fullName,
//           'email': email,
//           // 'createdAt': FieldValue.serverTimestamp(),
//         });
//         print("✅ User saved in Firestore: ${user.uid}");
//       }

//       return user;
//     } catch (e) {
//       print("❌ Signup error: $e");
//       rethrow;
//     }
//   }

//   // 🔹 Login in service
//   Future<UserCredential> login(String email, String password) async {
//     try {
//       final credential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       print("✅ User logged in: ${credential.user?.uid}");
//       return credential;
//     } on FirebaseAuthException catch (e) {
//       print("❌ FirebaseAuthException during login: ${e.code} — ${e.message}");
//       rethrow;
//     } catch (e) {
//       print("❌ Unexpected login error: $e");
//       rethrow;
//     }
//   }

//   // 🔹 Forgot Password
//   Future<void> forgotPassword(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//       print("✅ Password reset email sent to $email");
//     } on FirebaseAuthException catch (e) {
//       print("❌ FirebaseAuthException during password reset: ${e.code} — ${e.message}");
//       rethrow;
//     } catch (e) {
//       print("❌ Unexpected forgot password error: $e");
//       rethrow;
//     }
//   }

//   // 🔹 Logout
//   Future<void> logout() async {
//     try {
//       await _auth.signOut();
//       print("👋 User successfully logged out");
//     } catch (e) {
//       print("❌ Error during logout: $e");
//       rethrow;
//     }
//   }

//   // 🔹 Get current signed-in user
//   User? get currentUser => _auth.currentUser;

//   // 🔹 Listen to auth state changes
//   Stream<User?> get authStateChanges => _auth.authStateChanges();

//   // 🔹 Get all users (excluding current user)
//   Future<List<Map<String, dynamic>>> getAllUsers() async {
//     try {
//       final currentUid = _auth.currentUser?.uid;
//       final snapshot = await _firestore.collection('users').get();

//       final users = snapshot.docs
//           .where((doc) => doc.id != currentUid)
//           .map((doc) => doc.data())
//           .toList();

//       print("👥 Fetched ${users.length} users");
//       return users;
//     } catch (e) {
//       print("❌ Error fetching users: $e");
//       rethrow;
//     }
//   }
// }
