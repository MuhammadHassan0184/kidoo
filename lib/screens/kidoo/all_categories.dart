import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kidoo/Config/routes/routes_name.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/action_sheet.dart';
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

// Inside GridView.builder -> GestureDetector
onLongPress: () {
  CourseActionSheet.show(
    courseId: course.id,
    currentTitle: course["title"],
    onUpdated: () {
      // Optional: refresh state if needed
    },
    onDeleted: () {
      // Optional: refresh state if needed
    },
  );
},

                  child: HomeCard(
                    label: title,
                    color: hexToColor(hex),
                    onPressed: () {
                      switch (title.toLowerCase()) {
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
                          Get.toNamed(
                              "${AppRoutesName.otherCourses}?id=${course.id}&title=${course["title"]}");
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
