import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/Config/app_colors.dart';
import 'package:kidoo/Widgets/banner_card.dart';
import 'package:kidoo/Widgets/home_card.dart';

class Vegitable extends StatelessWidget {
  const Vegitable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.bgColor,
      backgroundColor: AppColors.black,
      appBar: AppBar(
      backgroundColor: AppColors.bgColor,
      leading: IconButton(onPressed: (){Get.offNamed("/Home");}, icon: Icon(Icons.arrow_back, color: AppColors.twhite,),),
        title: Text("Vegitables", style: TextStyle(color: AppColors.twhite, fontWeight: FontWeight.bold,), ), centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerCard(label: "Vegitable Names",),
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
            HomeCardimg(label: "Potato", color: AppColors.orange, img: "assets/potato.jpg",),
            HomeCardimg(label: "Carrot", color: AppColors.red, img: "assets/carrot.jpg",),
            HomeCardimg(label: "Cucumber", color: AppColors.green, img: "assets/cucumber.jpg",),
            HomeCardimg(label: "Onion", color: AppColors.orange, img: "assets/onion.jpg",),
            HomeCardimg(label: "Ginger", color: AppColors.orange, img: "assets/ginger.jpg",),
            HomeCardimg(label: "Tomato", color: AppColors.red, img: "assets/tomato.jpg",),
            HomeCardimg(label: "Garlic", color: AppColors.yellow, img: "assets/garlic.jpg",),
            HomeCardimg(label: "Pumpkin", color: AppColors.orange, img: "assets/pumpkin.jpg",),
            HomeCardimg(label: "Capsicum", color: AppColors.red, img: "assets/capsicum.jpg",),
            HomeCardimg(label: "Turnip", color: AppColors.yellow, img: "assets/turnip.jpg",),
            HomeCardimg(label: "Mushroom", color: AppColors.orange, img: "assets/mushrooms.jpg",),
            HomeCardimg(label: "Lady's finger", color: AppColors.green, img: "assets/ladyfinger.jpg",),
            HomeCardimg(label: "Green papaya", color: AppColors.fruits, img: "assets/papaya.jpg",),
            HomeCardimg(label: "Sweet potato", color: AppColors.red, img: "assets/sweet-potato.png",),
            HomeCardimg(label: "Beetroot", color: AppColors.red, img: "assets/beetroot.jpg",),
            HomeCardimg(label: "Radish ", color: AppColors.orange, img: "assets/radishmuli.jpg",),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}