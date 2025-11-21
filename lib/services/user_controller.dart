import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxString uid = "".obs;
  RxString fullName = "".obs;
  RxString email = "".obs;
  RxString country = "".obs;
  RxString role = "".obs;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// ⭐ SET USER (Fix for your error)
  void setUser({
    required String uid,
    required String fullName,
    required String email,
    required String country,
    required String role,
  }) {
    this.uid.value = uid;
    this.fullName.value = fullName;
    this.email.value = email;
    this.country.value = country;
    this.role.value = role;
  }

  /// Load from Firestore
  Future<void> fetchUserFromFirestore(String userId) async {
    try {
      DocumentSnapshot snap =
          await _db.collection("users").doc(userId).get();

      if (snap.exists) {
        setUser(
          uid: snap["uid"],
          fullName: snap["fullName"],
          email: snap["email"],
          country: snap["country"],
          role: snap["role"],
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print("❌ Error loading user: $e");
    }
  }

  /// Clear after logout
  void clearUser() {
    uid.value = "";
    fullName.value = "";
    email.value = "";
    country.value = "";
    role.value = "";
  }
}
