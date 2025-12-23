import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/action_sheet.dart';
import 'package:kidoo/Widgets/banner_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherCourses extends StatefulWidget {
  const OtherCourses({super.key});

  @override
  State<OtherCourses> createState() => _OtherCoursesState();
}

class _OtherCoursesState extends State<OtherCourses> {
  String selectedName = "";
  Color selectedColor = AppColors.green;

  final TextEditingController editTitleController = TextEditingController();

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
          "Other Courses",
          style: TextStyle(
            color: AppColors.twhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerCard(
              label: "Other Courses",
              selectedText: selectedName,
              selectedColor: selectedColor,
            ),

            SizedBox(height: 20),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("courses")
                    .doc("otherCourses")
                    .collection("lessons")
                    .orderBy("createdAt", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        "No Courses Added Yet...",
                        style: TextStyle(color: AppColors.twhite, fontSize: 18),
                      ),
                    );
                  }

                  return GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final lesson = snapshot.data!.docs[index];

                      Color cardColor = Color(
                        int.parse(
                          lesson["theme"].toString().replaceFirst('#', '0xff'),
                        ),
                      );

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedName = lesson["title"];
                            selectedColor = cardColor;
                          });
                        },

                        // ✅ LONG PRESS ACTION
                        onLongPress: () {
                          CourseActionSheet.show(
                            courseId: lesson.id,
                            currentTitle: lesson["title"],
                            collectionName: "courses/otherCourses/lessons",
                            onUpdated: () {
                              // Optional: setState to refresh selectedName
                            },
                            onDeleted: () {
                              // Optional: setState to clear selection if deleted
                            },
                          );
                        },

                        child: HomeCard(
                          label: lesson["title"],
                          color: cardColor,
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
