// ignore_for_file: deprecated_member_use, use_build_context_synchronously, unnecessary_import
import 'package:kidoo/Widgets/pickers/picker_controllers/color_picker_controller.dart';
import 'package:kidoo/Widgets/pickers/input_%20picker.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kidoo/Config/routes/routes_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ==========================================================
// MAIN ADD LESSON SCREEN (TAB LAYOUT)
// ==========================================================
class AddLesson extends StatefulWidget {
  const AddLesson({super.key});

  @override
  State<AddLesson> createState() => _AddLessonState();
}

class _AddLessonState extends State<AddLesson>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: () => Get.offNamed("/MainManue"),
          icon: Icon(Icons.arrow_back, color: AppColors.twhite),
        ),
        title: const Text(
          "Add Lesson",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: controller,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          tabs: const [
            Tab(text: "None"),
            Tab(text: "Letter"),
            Tab(text: "Image"),
          ],
        ),
      ),

      body: TabBarView(
        controller: controller,
        children: [
          AddLessonNone(),
          Center(
            child: Text("Letter Coming Soon",
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          Center(
            child: Text("Image Coming Soon",
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ],
      ),
    );
  }
}

// ==========================================================
// ADD LESSON (NONE)
// ==========================================================
class AddLessonNone extends StatefulWidget {
  const AddLessonNone({super.key});

  @override
  State<AddLessonNone> createState() => _AddLessonNoneState();
}

class _AddLessonNoneState extends State<AddLessonNone> {
  final titleController = TextEditingController();
  // final themeController = TextEditingController();
  final colorsCtrl = ColorPickerController();
  void initState() {
    super.initState();
    colorsCtrl.bindRefresh(() => setState(() {}));
  }

  void refresh() => setState(() {});

  String? selectedCourse;

  // ✔ Updated course names
  final List<String> courses = [
    "colors",
    "alphabets",
    "otherCourses",
    "vegetables",
    "fruits",
  ];

  // ✔ Updated screen routes
 // ✔ Updated screen routes
final Map<String, String> courseRoutes = {
  "colors": AppRoutesName.colortask,
  "alphabets": AppRoutesName.alphabets,
  "otherCourses": AppRoutesName.otherCourses,
  "vegetables": AppRoutesName.vegitable,
  "fruits": AppRoutesName.fruits,
};


  Future<void> addLesson() async {
    if (selectedCourse == null ||
        titleController.text.trim().isEmpty ||
        colorsCtrl.colorCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    try {
      final lessonRef = await FirebaseFirestore.instance
          .collection("courses")
          .doc(selectedCourse)
          .collection("lessons")
          .add({
        "title": titleController.text.trim(),
        "theme": colorsCtrl.colorCtrl.text.trim(),
        "createdAt": DateTime.now(),
      });

      await lessonRef.update({"lessonId": lessonRef.id});

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Lesson Added")),
      );

      // Clear fields
      titleController.clear();
      colorsCtrl.colorCtrl.clear();

      // ======================================================
      // NAVIGATE TO THE SCREEN SELECTED IN DROPDOWN
      // ======================================================
      String? route = courseRoutes[selectedCourse];

      if (route != null) {
        Get.offNamed(route);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Route not found for this course")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 25),

            // TITLE FIELD
            Text("Title",
                style: TextStyle(
                    color: AppColors.twhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 10),

            TextField(
              controller: titleController,
              style: TextStyle(color: AppColors.twhite),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.bgColor,
                hintText: "Enter Lesson Title",
                hintStyle: TextStyle(color: AppColors.info),
                contentPadding: const EdgeInsets.all(16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: AppColors.zink),
                ),
              ),
            ),

            SizedBox(height: 25),

            // THEME FIELD
            Text("Color Theme",
                style: TextStyle(
                    color: AppColors.twhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            PickerInput(
            label: "Pick Color",
            controller: colorsCtrl.colorCtrl,
            onTap: () => colorsCtrl.pick(context, refresh),
            suffix: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: colorsCtrl.selectedColor,
                shape: BoxShape.circle,
              ),
            ),
          ),

            SizedBox(height: 25),

            // COURSE DROPDOWN
            Text("Select Course",
                style: TextStyle(
                    color: AppColors.twhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.primary),
                color: AppColors.bgColor,
              ),
              child: DropdownButtonFormField(
                value: selectedCourse,
                dropdownColor: AppColors.bgColor,
                decoration: const InputDecoration(border: InputBorder.none),
                style: TextStyle(color: AppColors.twhite, fontSize: 16),
                items: courses.map((course) {
                  return DropdownMenuItem(
                    value: course,
                    child: Text(course,
                        style: TextStyle(color: AppColors.twhite)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCourse = value;
                  });
                },
              ),
            ),

            SizedBox(height: 40),

            // ADD BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.zink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: addLesson,
                child: const Text(
                  "Add Lesson",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
