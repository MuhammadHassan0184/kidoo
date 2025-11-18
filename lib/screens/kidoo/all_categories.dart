import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/home_card.dart';

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
          "All Courses",
          style: TextStyle(
            color: AppColors.twhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      // ------------------ BODY ------------------
      body: 
      Padding(
        padding: const EdgeInsets.all(15),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1, 
          ),
          children:  [
            HomeCard(label: "Colors", color: AppColors.colors, onPressed: () {
              Get.toNamed("/Colortask");
            },),
            HomeCard(label: "A_B_C", color: AppColors.abc, onPressed: () {
              Get.toNamed("/Alphabets");
            },),
            HomeCardimg(label: "Fruits", color: AppColors.fruits, img: "assets/fruits.jpg", onPressed: () {
              Get.toNamed("/Fruits");
            },),
            HomeCardimg(label: "Vegetables", color: AppColors.vegetable, img: "assets/veges.jpg", onPressed: () {
              Get.toNamed("/Vegitable");
            },),
            
          ],
        ),
      ),
    );
  }
}
