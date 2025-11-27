import 'package:kidoo/Config/routes/routes_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

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
        title: Text(
          "All Courses",
          style: TextStyle(
            color: AppColors.twhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("courses")
              .orderBy("createdAt", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
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

            return GridView.builder(
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, i) {
                final course = data[i];

                String title = course["title"];
                String hex = course["themeColor"];

                return GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "Course Options",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: Text("What do you want to do with '$title'?"),
                        actions: [
                          // ===== EDIT BUTTON =====
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);

                              TextEditingController editController =
                                  TextEditingController(text: title);

                              // Show edit dialog
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    "Edit Course Name",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: TextField(
                                    controller: editController,
                                    decoration: InputDecoration(
                                      hintText: "Enter new course title",
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        String newTitle = editController.text
                                            .trim();

                                        if (newTitle.isNotEmpty) {
                                          await FirebaseFirestore.instance
                                              .collection("courses")
                                              .doc(course.id)
                                              .update({"title": newTitle});

                                          // ignore: use_build_context_synchronously
                                          Navigator.pop(context);

                                          Get.snackbar(
                                            "Updated",
                                            "Course name updated!",
                                            backgroundColor: Colors.green,
                                            colorText: Colors.white,
                                          );
                                        }
                                      },
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                          color: AppColors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),

                          // ===== DELETE BUTTON =====
                          TextButton(
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection("courses")
                                  .doc(course.id)
                                  .delete();

                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);

                              Get.snackbar(
                                "Deleted",
                                "'$title' removed successfully",
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),

                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                        ],
                      ),
                    );
                  },

                  child: HomeCard(
                    label: title,
                    color: hexToColor(hex),
                    onPressed: () {
                      switch (title) {
                        case "colors":
                          Get.toNamed("/Colortask");
                          break;

                        case "fruits":
                          Get.toNamed("/Fruits");
                          break;

                        case "alphabets":
                          Get.toNamed("/Alphabets");
                          break;

                        case "vegetables":
                          Get.toNamed("/Vegitable");
                          break;

                        default:
                          // Get.to(() => const OtherCourses());
                          Get.toNamed("${AppRoutesName.otherCourses}?id=${course.id}&title=${course["title"]}");

                      }
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// -----------------------------------------------------------
// 🎨 HEX → COLOR Converter
// -----------------------------------------------------------

Color hexToColor(String code) {
  try {
    code = code.replaceAll("#", "").trim();

    if (code.length == 6) {
      return Color(int.parse("FF$code", radix: 16));
    }

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
