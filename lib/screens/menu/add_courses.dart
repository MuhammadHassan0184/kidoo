import 'package:kidoo/Widgets/pickers/picker_controllers/color_picker_controller.dart';
import 'package:kidoo/Widgets/pickers/input_%20picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCourses extends StatefulWidget {
  const AddCourses({super.key});

  @override
  State<AddCourses> createState() => _AddCoursesState();
}

class _AddCoursesState extends State<AddCourses>
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
          "Add Course",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          TabBar(
            padding: EdgeInsets.symmetric(horizontal: 30),
            controller: controller,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: const [
              Tab(text: "none"),
              Tab(text: "letter"),
              Tab(text: "image"),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                AddCourseNone(), // updated below
                // AddCourseLetter(),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "letter Coming Soon",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Image Coming Soon",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------
// ADD COURSE NONE — UPDATED (ALLOWED CONDITION REMOVED)
// ----------------------------------------------------------------

class AddCourseNone extends StatefulWidget {
  const AddCourseNone({super.key});

  @override
  State<AddCourseNone> createState() => _AddCourseNoneState();
}

class _AddCourseNoneState extends State<AddCourseNone> {
  final TextEditingController titleController = TextEditingController();
  final colorCtrl = ColorPickerController();
  // final TextEditingController colorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    colorCtrl.bindRefresh(() => setState(() {}));
  }

  void refresh() => setState(() {});

  bool isLoading = false;

  Future<void> addCourse() async {
    String title = titleController.text.trim();

    // allowedCourses condition removed

    if (title.isEmpty || colorCtrl.colorCtrl.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill all fields")));
      return;
    }

    setState(() => isLoading = true);

    try {
      final docRef = await FirebaseFirestore.instance.collection("courses").add(
        {
          "title": title,
          // "themeColor": colorController.text.trim(),
          "themeColor": colorCtrl.colorCtrl.text.trim(),
          "createdAt": DateTime.now(),
        },
      );

      await docRef.update({"courseId": docRef.id});

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Course Added Successfully")));

      titleController.clear();
      // colorController.clear();
      colorCtrl.colorCtrl.clear();

      Future.delayed(Duration(milliseconds: 400), () {
        Get.offNamed("/AllCategories");
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),

          Text("Title", style: TextStyle(color: AppColors.info, fontSize: 19)),
          SizedBox(height: 10),

          AppTextField(
            label: "Enter Course Title",
            controller: titleController,
          ),

          SizedBox(height: 20),

          Text(
            "Color Theme",
            style: TextStyle(color: AppColors.info, fontSize: 19),
          ),
          SizedBox(height: 10),
          PickerInput(
            label: "Pick Color",
            controller: colorCtrl.colorCtrl,
            onTap: () => colorCtrl.pick(context, refresh),
            suffix: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: colorCtrl.selectedColor,
                shape: BoxShape.circle,
              ),
            ),
          ),

          SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.zink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: isLoading ? null : addCourse,
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
