import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/Config/app_colors.dart';
import 'package:kidoo/Widgets/lesson_list.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: () {
            Get.offNamed("/MainManue");
          },
          icon: Icon(Icons.arrow_back, color: AppColors.twhite),
        ),
        title: Text(
          "All Categories",
          style: TextStyle(
            color: AppColors.twhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      // ------------------ BODY ------------------
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            int crossAxisCount = 2; 
            if (width > 600) crossAxisCount = 3; 
            if (width > 900) crossAxisCount = 4; 

            return GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shrinkWrap: true,
              itemCount: 12, 
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: width > 600 ? 3.2 : 2.6, 
              ),
              itemBuilder: (context, index) {
                return LessonList(); 
              },
            );
          },
        ),
      ),
    );
  }
}
