import 'package:kidoo/controllers/courses_controllers/alphabets_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/action_sheet.dart';
import 'package:kidoo/Widgets/banner_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alphabets extends StatelessWidget {
  Alphabets({super.key});

  final AlphabetsController controller = Get.put(AlphabetsController());

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
          "Alphabets",
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
                label: "Alphabets",
                selectedText: controller.selectedName.value,
                selectedColor: controller.selectedColor.value,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: controller.getAlphabets(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final lessons = snapshot.data!.docs;

                  if (lessons.isEmpty) {
                    return Center(
                      child: Text(
                        "No Alphabets Added Yet",
                        style: TextStyle(color: AppColors.twhite, fontSize: 18),
                      ),
                    );
                  }

                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
                        onTap: () => controller.selectAlphabet(title, color),
                        onLongPress: () {
                          // ✅ Using reusable bottom sheet
                          CourseActionSheet.show(
                            courseId: doc.id,
                            currentTitle: title,
                            collectionName: "courses/alphabets/lessons", // Correct collection
                            onUpdated: () {
                              controller.selectAlphabet(title, color);
                            },
                            onDeleted: () {
                              if (controller.selectedName.value == title) {
                                controller.selectedName.value = "";
                              }
                            },
                          );
                        },
                        child: HomeCard(
                          label: title,
                          color: color,
                          onTap: () => controller.selectAlphabet(title, color),
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
