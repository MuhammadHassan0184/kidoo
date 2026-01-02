import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/banner_card.dart';
import 'package:kidoo/Widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Vegitable extends StatefulWidget {
  const Vegitable({super.key});

  @override
  State<Vegitable> createState() => _VegitableState();
}

class _VegitableState extends State<Vegitable> {
  String selectedVeg = ""; // show in circle

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
          "Vegetables",
          style: TextStyle(color: AppColors.twhite, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // TOP BANNER — SHOW SELECTED VEGETABLE NAME
            BannerCard(
              label: "Vegetable Names",
              selectedText: selectedVeg,
            ),

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
                  vegItem("Potato", AppColors.orange, "assets/potato.jpg"),
                  vegItem("Carrot", AppColors.red, "assets/carrot.jpg"),
                  vegItem("Cucumber", AppColors.green, "assets/cucumber.jpg"),
                  vegItem("Onion", AppColors.orange, "assets/onion.jpg"),
                  vegItem("Ginger", AppColors.orange, "assets/ginger.jpg"),
                  vegItem("Tomato", AppColors.red, "assets/tomato.jpg"),
                  vegItem("Garlic", AppColors.yellow, "assets/garlic.jpg"),
                  vegItem("Pumpkin", AppColors.orange, "assets/pumpkin.jpg"),
                  vegItem("Capsicum", AppColors.red, "assets/capsicum.jpg"),
                  vegItem("Turnip", AppColors.yellow, "assets/turnip.jpg"),
                  vegItem("Mushroom", AppColors.orange, "assets/mushrooms.jpg"),
                  vegItem("Lady's finger", AppColors.green, "assets/ladyfinger.jpg"),
                  vegItem("Green papaya", AppColors.fruits, "assets/papaya.jpg"),
                  vegItem("Sweet potato", AppColors.red, "assets/sweet-potato.png"),
                  vegItem("Beetroot", AppColors.red, "assets/beetroot.jpg"),
                  vegItem("Radish", AppColors.orange, "assets/radishmuli.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // SINGLE VEGETABLE CARD WITH onTap
  Widget vegItem(String name, Color color, String imgPath) {
    return HomeCardimg(
      label: name,
      color: color,
      img: imgPath,
      onTap: () {
        setState(() {
          selectedVeg = name; // ✔ Now top banner updates
        });
      },
    );
  }
}
