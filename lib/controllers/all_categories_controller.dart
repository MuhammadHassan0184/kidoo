import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCategoriesController extends GetxController {

  /// READ all courses
  Stream<QuerySnapshot> getCourses() {
    return FirebaseFirestore.instance
        .collection("courses")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  /// DELETE course
  Future<void> deleteCourse(String id) async {
    await FirebaseFirestore.instance
        .collection("courses")
        .doc(id)
        .delete();
  }

  /// UPDATE course title
  Future<void> updateCourse(String id, String newTitle) async {
    await FirebaseFirestore.instance
        .collection("courses")
        .doc(id)
        .update({"title": newTitle});
  }

  /// Hex → Color
  Color hexToColor(String code) {
    try {
      code = code.replaceAll("#", "").trim();

      if (code.length == 6) return Color(int.parse("FF$code", radix: 16));

      if (code.length == 3) {
        final r = code[0] + code[0];
        final g = code[1] + code[1];
        final b = code[2] + code[2];
        return Color(int.parse("FF$r$g$b", radix: 16));
      }

      return const Color(0xFF676767);
    } catch (e) {
      return const Color(0xFF676767);
    }
  }
}
