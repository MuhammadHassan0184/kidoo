import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/Config/app_colors.dart';
import 'package:kidoo/Widgets/banner_card.dart';
import 'package:kidoo/Widgets/home_card.dart';

class Alphabets extends StatelessWidget {
  const Alphabets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.bgColor,
      backgroundColor: AppColors.black,
      appBar: AppBar(
      backgroundColor: AppColors.bgColor,
      leading: IconButton(onPressed: (){Get.offNamed("/Home");}, icon: Icon(Icons.arrow_back, color: AppColors.twhite,),),
        title: Text("Alphabets", style: TextStyle(color: AppColors.twhite, fontWeight: FontWeight.bold,), ), centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerCard(label: "Alphabets",),
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
                  HomeCard(label: "A", color: AppColors.red),
            HomeCard(label: "B", color: AppColors.yellow),
            HomeCard(label: "C", color: AppColors.green),
            HomeCard(label: "D", color: AppColors.orange),
            HomeCard(label: "E", color: AppColors.blue),
            HomeCard(label: "F", color: AppColors.violet),
            HomeCard(label: "G", color: AppColors.pink),
            HomeCard(label: "H", color: AppColors.skin),
            HomeCard(label: "I", color: AppColors.yellow),
            HomeCard(label: "J", color: AppColors.green),
            HomeCard(label: "K", color: AppColors.orange),
            HomeCard(label: "L", color: AppColors.blue),
            HomeCard(label: "M", color: AppColors.violet),
            HomeCard(label: "N", color: AppColors.pink),
            HomeCard(label: "o", color: AppColors.skin),
            HomeCard(label: "P", color: AppColors.blue),
            HomeCard(label: "Q", color: AppColors.green),
            HomeCard(label: "R", color: AppColors.orange),
            HomeCard(label: "S", color: AppColors.pink),
            HomeCard(label: "T", color: AppColors.skin),
            HomeCard(label: "U", color: AppColors.red),
            HomeCard(label: "V", color: AppColors.yellow),
            HomeCard(label: "W", color: AppColors.blue),
            HomeCard(label: "X", color: AppColors.green),
            HomeCard(label: "Y", color: AppColors.orange),
            HomeCard(label: "Z", color: AppColors.violet),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
            