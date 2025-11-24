// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:kidoo/screens/menu/add_course_letter.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:kidoo/Config/utils/app_colors.dart';
// import 'package:kidoo/Widgets/app_text_field.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:flutter/material.dart';

// class AddCourses extends StatefulWidget {
//   const AddCourses({super.key});

//   @override
//   State<AddCourses> createState() => _AddCoursesState();
// }

// class _AddCoursesState extends State<AddCourses>
//     with SingleTickerProviderStateMixin {
//   late TabController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = TabController(length: 3, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.black,
//       appBar: AppBar(
//         backgroundColor: AppColors.bgColor,
//         leading: IconButton( onPressed: () { Get.offNamed("/MainManue"); }, icon: Icon(Icons.arrow_back, color: AppColors.twhite), ),
//         title: const Text(
//           "Add Course",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),

//       /// TAB BAR ALWAYS VISIBLE
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 50),
//             child: TabBar(
//               controller: controller,
//               labelColor: Colors.blue,
//               unselectedLabelColor: Colors.grey,
//               indicatorColor: Colors.blue,
//               tabs: [
//                 Tab(text: "none"),
//                 Tab(text: "letter"),
//                 Tab(text: "image"),
//               ],
//             ),
//           ),

//           /// TAB SCREENS
//           Expanded(
//             child: TabBarView(
//               controller: controller,
//               children: [
//                 AddCourseNone(),
//                 AddCourseLetter(),
//                 // AddCourseImage(),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// // class AddCourseNone extends StatelessWidget {
// //   const AddCourseNone({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(15),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           SizedBox(height: 20),
// //           Text("Title",
// //               style: TextStyle(color: AppColors.info, fontSize: 19)),
// //           const SizedBox(height: 10),
// //           AppTextField(label: "Here"),

// //           SizedBox(height: 20),

// //           Text("Color Theme",
// //               style: TextStyle(color: AppColors.info, fontSize: 19)),
// //           const SizedBox(height: 10),
// //           AppTextField(label: "Here"),

// //          SizedBox(height: 30),

// //           SizedBox(
// //             width: double.infinity,
// //             height: 50,
// //             child: ElevatedButton(
// //               style: ElevatedButton.styleFrom(
// //                   backgroundColor: AppColors.zink,
// //                   shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(10))),
// //               onPressed: () {
                
// //               },
// //               child: const Text(
// //                 "Add",
// //                 style: TextStyle(
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 19),
// //               ),
// //             ),
// //           ),
          
// //         ],
// //       ),
// //     );
// //   }
// // }


// class AddCourseNone extends StatefulWidget {
//   const AddCourseNone({super.key});

//   @override
//   State<AddCourseNone> createState() => _AddCourseNoneState();
// }

// class _AddCourseNoneState extends State<AddCourseNone> {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController colorController = TextEditingController();

//   bool isLoading = false;

//   Future<void> addCourse() async {
//     if (titleController.text.isEmpty || colorController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please fill all fields")));
//       return;
//     }

//     setState(() => isLoading = true);

//     try {
//       final docRef = await FirebaseFirestore.instance.collection("courses").add({
//         "title": titleController.text.trim(),
//         "themeColor": colorController.text.trim(),
//         "createdAt": DateTime.now(),
//       });

//       // Add the ID inside the document
//       await docRef.update({"courseId": docRef.id});

//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Course Added Successfully")));

//       // Clear fields
//       titleController.clear();
//       colorController.clear();

//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Error: $e")));
//     }

//     setState(() => isLoading = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 20),
//           Text("Title",
//               style: TextStyle(color: AppColors.info, fontSize: 19)),
//           SizedBox(height: 10),
//           AppTextField(
//             label: "Enter Course Title",
//             controller: titleController,
//           ),

//           SizedBox(height: 20),

//           Text("Color Theme",
//               style: TextStyle(color: AppColors.info, fontSize: 19)),
//           SizedBox(height: 10),
//           AppTextField(
//             label: "Enter Color (ex: #FF4500)",
//             controller: colorController,
//           ),

//           SizedBox(height: 30),

//           SizedBox(
//             width: double.infinity,
//             height: 50,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.zink,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//               onPressed: isLoading ? null : addCourse,
//               child: isLoading
//                   ? CircularProgressIndicator(color: Colors.white)
//                   : Text(
//                       "Add",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 19),
//                     ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/app_text_field.dart';
import 'package:kidoo/screens/menu/add_course_letter.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TabBar(
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
          ),

          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                AddCourseNone(),
                AddCourseLetter(),
                Container(
                  alignment: Alignment.center,
                  child: Text("Image Coming Soon",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AddCourseNone extends StatefulWidget {
  const AddCourseNone({super.key});

  @override
  State<AddCourseNone> createState() => _AddCourseNoneState();
}

class _AddCourseNoneState extends State<AddCourseNone> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  bool isLoading = false;

  // Allowed course titles
  final List<String> allowedCourses = [
    "colors",
    "alphabets",
    "fruits",
    "vegetables",
  ];

  Future<void> addCourse() async {
    String title = titleController.text.trim();

    // ❌ Check if title is allowed
    if (!allowedCourses.contains(title)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Course not found")),
      );
      return;
    }

    // ❌ check fields
    if (title.isEmpty || colorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final docRef =
          await FirebaseFirestore.instance.collection("courses").add({
        "title": title,
        "themeColor": colorController.text.trim(),
        "createdAt": DateTime.now(),
      });

      await docRef.update({"courseId": docRef.id});

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Course Added Successfully")),
      );

      titleController.clear();
      colorController.clear();

      Future.delayed(Duration(milliseconds: 400), () {
        Get.offNamed("/AllCategories");
      });

    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
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

          Text("Title",
              style: TextStyle(color: AppColors.info, fontSize: 19)),
          SizedBox(height: 10),
          AppTextField(
            label: "Enter Course Title",
            controller: titleController,
          ),

          SizedBox(height: 20),

          Text("Color Theme",
              style: TextStyle(color: AppColors.info, fontSize: 19)),
          SizedBox(height: 10),
          AppTextField(
            label: "Enter Color (ex: #FF4500)",
            controller: colorController,
          ),

          SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.zink,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
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
