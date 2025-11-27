import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/Config/utils/app_colors.dart';

class AlphabetsController extends GetxController {
  var selectedName = "".obs;
  var selectedColor = AppColors.green.obs;

  /// Stream of alphabet lessons from Firestore
  Stream<QuerySnapshot> getAlphabets() {
    return FirebaseFirestore.instance
        .collection("courses")
        .doc("alphabets")
        .collection("lessons")
        .snapshots();
  }

  /// Parse hex color string
  Color parseColor(String hexColor) {
    try {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");
      if (hexColor.length == 6) hexColor = "FF$hexColor";
      return Color(int.parse(hexColor, radix: 16));
    } catch (e) {
      return AppColors.green;
    }
  }

  /// Select an alphabet
  void selectAlphabet(String name, Color color) {
    selectedName.value = name;
    selectedColor.value = color;
  }

  /// Show lesson options dialog (Edit/Delete)
  void showAlphabetDialog(BuildContext context, QueryDocumentSnapshot doc) {
    final title = doc["title"];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Lesson Options", style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text("What do you want to do with '$title'?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              editAlphabetDialog(context, doc);
            },
            child: Text("Edit", style: TextStyle(color: Colors.blue)),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection("courses")
                  .doc("alphabets")
                  .collection("lessons")
                  .doc(doc.id)
                  .delete();
              Navigator.pop(context);
              Get.snackbar("Deleted", "'$title' removed!", backgroundColor: Colors.red, colorText: Colors.white);
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
        ],
      ),
    );
  }

  /// Edit alphabet dialog
  void editAlphabetDialog(BuildContext context, QueryDocumentSnapshot doc) {
    final editController = TextEditingController(text: doc["title"]);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Lesson"),
        content: TextField(
          controller: editController,
          decoration: InputDecoration(hintText: "Enter new lesson name"),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          TextButton(
            onPressed: () async {
              final newTitle = editController.text.trim();
              if (newTitle.isNotEmpty) {
                await FirebaseFirestore.instance
                    .collection("courses")
                    .doc("alphabets")
                    .collection("lessons")
                    .doc(doc.id)
                    .update({"title": newTitle});
                Navigator.pop(context);
                Get.snackbar("Updated", "Lesson updated successfully", backgroundColor: Colors.green, colorText: Colors.white);
              }
            },
            child: Text("Save", style: TextStyle(color: AppColors.blue, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
