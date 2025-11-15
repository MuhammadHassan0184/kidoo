import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/Config/app_colors.dart';
import 'package:kidoo/Widgets/banner_card.dart';
import 'package:kidoo/Widgets/home_card.dart';

class Colortask extends StatelessWidget {
  const Colortask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: () {
            Get.offNamed("/Home");
          },
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
            BannerCard(label: "Colors Name",),
            const SizedBox(height: 20),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                children: [
                  HomeCard(label: "Red", color: AppColors.red),
                  HomeCard(label: "Yellow", color: AppColors.yellow),
                  HomeCard(label: "Green", color: AppColors.green),
                  HomeCard(label: "Orange", color: AppColors.orange),
                  HomeCard(label: "Blue", color: AppColors.blue),
                  HomeCard(label: "Purple", color: AppColors.violet),
                  HomeCard(label: "Pink", color: AppColors.pink),
                  HomeCard(label: "Skin", color: AppColors.skin),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
