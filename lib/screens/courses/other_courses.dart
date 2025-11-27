import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/banner_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherCourses extends StatefulWidget {
  const OtherCourses({super.key});

  @override
  State<OtherCourses> createState() => _ColortaskState();
}

class _ColortaskState extends State<OtherCourses> {
  String selectedName = "";
  Color selectedColor = AppColors.green; // default circle color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: () {
            Get.offNamed("/AllCategories");
          },
          icon: Icon(Icons.arrow_back, color: AppColors.twhite),
        ),
        title: Text(
          "???",
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
            BannerCard(
              label: "???",
              selectedText: selectedName,
              selectedColor: selectedColor,
            ),
             SizedBox(height: 20),

             Center(child: Text("No Courses Added Yet...", style: TextStyle(color: AppColors.twhite, fontSize: 18),)),
          ],
        ),
      ),
    );
  }
}
