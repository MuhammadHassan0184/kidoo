import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kidoo/Config/utils/app_colors.dart';

class CourseActionSheet {
  // ===============================
  // Show the bottom sheet
  // ===============================
  static void show({
    required String courseId,
    required String currentTitle,
    String collectionName = "courses",
    VoidCallback? onUpdated,
    VoidCallback? onDeleted,
  }) {
    TextEditingController editController = TextEditingController(text: currentTitle);

    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: AppColors.bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit, color: Colors.blue),
                title: Text("Edit", style: TextStyle(color: AppColors.twhite)),
                onTap: () {
                  Navigator.pop(Get.context!);
                  _showEditDialog(
                    courseId: courseId,
                    collectionName: collectionName,
                    controller: editController,
                    onUpdated: onUpdated,
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text("Delete", style: TextStyle(color: Colors.red)),
                onTap: () async {
                  Navigator.pop(Get.context!);
                  await FirebaseFirestore.instance
                      .collection(collectionName)
                      .doc(courseId)
                      .delete();

                  Get.snackbar(
                    "Deleted",
                    "'$currentTitle' removed successfully",
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );

                  if (onDeleted != null) onDeleted();
                },
              ),
              ListTile(
                leading: Icon(Icons.close, color: Colors.grey),
                title: Text("Cancel", style: TextStyle(color: AppColors.twhite)),
                onTap: () => Navigator.pop(Get.context!),
              ),
            ],
          ),
        );
      },
    );
  }

  // ===============================
  // Show edit dialog
  // ===============================
  static void _showEditDialog({
    required String courseId,
    required String collectionName,
    required TextEditingController controller,
    VoidCallback? onUpdated,
  }) {
    showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.bgColor,
        title: Text("Edit Name", style: TextStyle(color: AppColors.twhite)),
        content: TextField(
          controller: controller,
          style: TextStyle(color: AppColors.twhite),
          decoration: InputDecoration(
            hintText: "Enter new title",
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(Get.context!),
            child: Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.zink),
            onPressed: () async {
              String newTitle = controller.text.trim();
              if (newTitle.isNotEmpty) {
                await FirebaseFirestore.instance
                    .collection(collectionName)
                    .doc(courseId)
                    .update({"title": newTitle});

                Navigator.pop(Get.context!);

                Get.snackbar(
                  "Updated",
                  "Name updated successfully!",
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );

                if (onUpdated != null) onUpdated();
              }
            },
            child: Text("Save", style: TextStyle(color: AppColors.twhite)),
          ),
        ],
      ),
    );
  }
}
