import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/Config/app_colors.dart';
import 'package:kidoo/Widgets/banner_card.dart';
import 'package:kidoo/Widgets/home_card.dart';


class Fruits extends StatelessWidget {
  const Fruits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.bgColor,
      backgroundColor: AppColors.black,
      appBar: AppBar(
      backgroundColor: AppColors.bgColor,
      leading: IconButton(onPressed: (){Get.offNamed("/Home");}, icon: Icon(Icons.arrow_back, color: AppColors.twhite,),),
        title: Text("Fruits", style: TextStyle(color: AppColors.twhite, fontWeight: FontWeight.bold,), ), centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerCard(label: "Fruits Names",),
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
            HomeCardimg(label: "Apple", color: AppColors.red, img: "assets/apple.jpg",),
            HomeCardimg(label: "Mango", color: AppColors.yellow, img: "assets/mango.jpg",),
            HomeCardimg(label: "Banana", color: AppColors.yellow, img: "assets/banana.jpg",),
            HomeCardimg(label: "Peach", color: AppColors.orange, img: "assets/peach.jpg",),
            HomeCardimg(label: "Strawberry", color: AppColors.red, img: "assets/strawberries.jpg",),
            HomeCardimg(label: "pineapple", color: AppColors.yellow, img: "assets/pineapple.jpg",),
            HomeCardimg(label: "Orange", color: AppColors.orange, img: "assets/orange.jpg",),
            HomeCardimg(label: "Blue Berry", color: AppColors.blue, img: "assets/bluebery.jpg",),
            HomeCardimg(label: "Grapes", color: AppColors.fruits, img: "assets/grapes.jpg",),
            HomeCardimg(label: "Cherry", color: AppColors.red, img: "assets/cherry.jpg",),
            HomeCardimg(label: "Black Berry", color: AppColors.blue, img: "assets/blackberry.jpg",),
            HomeCardimg(label: "Guava", color: AppColors.green, img: "assets/guava.jpg",),
            HomeCardimg(label: "Dragon Fruit", color: AppColors.red, img: "assets/dragonfruit.jpg",),
            HomeCardimg(label: "Dates", color: AppColors.orange, img: "assets/dates.jpg",),
            HomeCardimg(label: "Grape Fruit", color: AppColors.orange, img: "assets/grapefruit.jpg",),
            HomeCardimg(label: "Kiwi", color: AppColors.green, img: "assets/kiwi.jpg",),
            HomeCardimg(label: "Lychee", color: AppColors.red, img: "assets/lychee.jpg",),
            HomeCardimg(label: "Pomegranate", color: AppColors.orange, img: "assets/Pomegranate.jpg",),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}