// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:kidoo/Config/utils/app_colors.dart';
// import 'package:kidoo/Widgets/banner_card.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Colortask extends StatefulWidget {
//   const Colortask({super.key});

//   @override
//   State<Colortask> createState() => _ColortaskState();
// }

// class _ColortaskState extends State<Colortask> {
//   String selectedName = "";
//   Color selectedColor = AppColors.green;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.black,
//       appBar: AppBar(
//         backgroundColor: AppColors.bgColor,
//         leading: IconButton(
//           onPressed: () {
//             Get.offNamed("/AllCategories");
//           },
//           icon: Icon(Icons.arrow_back, color: AppColors.twhite),
//         ),
//         title: Text(
//           "Colors",
//           style: TextStyle(
//             color: AppColors.twhite,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             BannerCard(
//               label: "Colors Name",
//               selectedText: selectedName,
//               selectedColor: selectedColor,
//             ),

//             SizedBox(height: 20),

//             Expanded(
//               child: StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection("courses")
//                     .doc("colors")
//                     .collection("lessons")
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   /// 🔄 Loading state
//                   if (!snapshot.hasData) {
//                     return Center(child: CircularProgressIndicator());
//                   }

//                   final userLessons = snapshot.data!.docs;

//                   /// 🔥 Combine fixed cards + Firestore lessons
//                   final List<Widget> allCards = [
//                     /// 🔒 FIXED COLOR CARDS (always visible)

//                     /// 🟩 USER ADDED FIRESTORE LESSONS
//                     ...userLessons.map((doc) {
//   final title = doc["title"];
//   final theme = doc["theme"];
//   final Color boxColor = _parseColor(theme);

//   return GestureDetector(
//     onLongPress: () {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text(
//             "Lesson Options",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           content: Text("What do you want to do with '$title'?"),
//           actions: [
//             // ---------------- EDIT ----------------
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);

//                 TextEditingController editController =
//                     TextEditingController(text: title);

//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text("Edit Lesson"),
//                     content: TextField(
//                       controller: editController,
//                       decoration: InputDecoration(
//                         hintText: "Enter new lesson name",
//                       ),
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: Text("Cancel"),
//                       ),
//                       TextButton(
//                         onPressed: () async {
//                           String newTitle = editController.text.trim();
//                           if (newTitle.isNotEmpty) {
//                             await FirebaseFirestore.instance
//                                 .collection("courses")
//                                 .doc("colors")
//                                 .collection("lessons")
//                                 .doc(doc.id)
//                                 .update({"title": newTitle});

//                             Navigator.pop(context);

//                             Get.snackbar(
//                               "Updated",
//                               "Lesson updated successfully",
//                               backgroundColor: Colors.green,
//                               colorText: Colors.white,
//                             );
//                           }
//                         },
//                         child: Text(
//                           "Save",
//                           style: TextStyle(
//                             color: AppColors.blue,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               child: Text("Edit", style: TextStyle(color: Colors.blue)),
//             ),

//             // ---------------- DELETE ----------------
//             TextButton(
//               onPressed: () async {
//                 await FirebaseFirestore.instance
//                     .collection("courses")
//                     .doc("colors")
//                     .collection("lessons")
//                     .doc(doc.id)
//                     .delete();

//                 Navigator.pop(context);

//                 Get.snackbar(
//                   "Deleted",
//                   "'$title' removed!",
//                   backgroundColor: Colors.red,
//                   colorText: Colors.white,
//                 );
//               },
//               child: Text("Delete", style: TextStyle(color: Colors.red)),
//             ),

//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("Cancel"),
//             ),
//           ],
//         ),
//       );
//     },

//     child: HomeCard(
//       label: title,
//       color: boxColor,
//       onTap: () {
//         setState(() {
//           selectedName = title;
//           selectedColor = boxColor;
//         });
//       },
//     ),
//   );
// }).toList(),
//                   ];

//                   return GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithMaxCrossAxisExtent(
//                       maxCrossAxisExtent: 250,
//                       mainAxisSpacing: 16,
//                       crossAxisSpacing: 16,
//                       childAspectRatio: 1,
//                     ),
//                     itemCount: allCards.length,
//                     itemBuilder: (context, index) {
//                       return allCards[index];
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// 🔵 Convert theme string to color
//  Color _parseColor(String hexColor) {
//   try {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");

//     if (hexColor.length == 6) {
//       hexColor = "FF$hexColor"; // add opacity
//     }

//     return Color(int.parse(hexColor, radix: 16));
//   } catch (e) {
//     return AppColors.green; // fallback
//   }
// }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/banner_card.dart';
import 'package:kidoo/controllers/courses_controllers/color_task_controller.dart';

class Colortask extends StatelessWidget {
  Colortask({super.key});

  final ColortaskController controller = Get.put(ColortaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: () => Get.offNamed("/AllCategories"),
          icon: Icon(Icons.arrow_back, color: AppColors.twhite),
        ),
        title: Text(
          "Colors",
          style: TextStyle(
            color: AppColors.twhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => BannerCard(
                label: "Colors Name",
                selectedText: controller.selectedName.value,
                selectedColor: controller.selectedColor.value,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: controller.getLessons(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final data = snapshot.data!.docs;

                  if (data.isEmpty) {
                    return Center(
                      child: Text(
                        "No Courses Added Yet",
                        style: TextStyle(color: AppColors.twhite, fontSize: 18),
                      ),
                    );
                  }

                  final lessons = snapshot.data!.docs;

                  if (lessons.isEmpty) {
                    return Center(
                      child: Text(
                        "No Colors Added Yet",
                        style: TextStyle(color: AppColors.twhite, fontSize: 18),
                      ),
                    );
                  }

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1,
                        ),
                    itemCount: lessons.length,
                    itemBuilder: (context, index) {
                      final doc = lessons[index];
                      final title = doc["title"];
                      final theme = doc["theme"];
                      final color = controller.parseColor(theme);

                      return GestureDetector(
                        onTap: () => controller.selectLesson(title, color),
                        onLongPress: () =>
                            controller.showLessonDialog(context, doc),
                        child: HomeCard(
                          label: title,
                          color: color,
                          onTap: () => controller.selectLesson(title, color),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
