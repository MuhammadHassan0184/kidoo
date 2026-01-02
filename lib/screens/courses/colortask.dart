import 'package:kidoo/controllers/courses_controllers/color_task_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/action_sheet.dart';
import 'package:kidoo/Widgets/banner_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                          onLongPress: () {
                          // Using reusable bottom sheet
                          CourseActionSheet.show(
                            courseId: doc.id,
                            currentTitle: title,
                            collectionName: "courses/colors/lessons",
                            onUpdated: () {
                              // Optional: refresh selection
                              controller.selectLesson(title, color);
                            },
                            onDeleted: () {
                              // Optional: clear selection if deleted
                              if (controller.selectedName.value == title) {
                                controller.selectedName.value = "";
                              }
                            },
                          );
                        },
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
