import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/banner_card.dart';
import 'package:kidoo/Widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Fruits extends StatefulWidget {
  const Fruits({super.key});

  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  String selectedFruit = "";
  Color selectedColor = AppColors.green;

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
          "Fruits",
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

            /// 🔵 Top Banner Showing Selected Fruit
            BannerCard(
              label: "Fruits Names",
              selectedText: selectedFruit,
              selectedColor: selectedColor,
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
                  fruitItem("Apple", AppColors.red, "assets/apple.jpg"),
                  fruitItem("Mango", AppColors.yellow, "assets/mango.jpg"),
                  fruitItem("Banana", AppColors.yellow, "assets/banana.jpg"),
                  fruitItem("Peach", AppColors.orange, "assets/peach.jpg"),
                  fruitItem("Strawberry", AppColors.red, "assets/strawberries.jpg"),
                  fruitItem("Pineapple", AppColors.yellow, "assets/pineapple.jpg"),
                  fruitItem("Orange", AppColors.orange, "assets/orange.jpg"),
                  fruitItem("Blue Berry", AppColors.blue, "assets/bluebery.jpg"),
                  fruitItem("Grapes", AppColors.fruits, "assets/grapes.jpg"),
                  fruitItem("Cherry", AppColors.red, "assets/cherry.jpg"),
                  fruitItem("Black Berry", AppColors.blue, "assets/blackberry.jpg"),
                  fruitItem("Guava", AppColors.green, "assets/guava.jpg"),
                  fruitItem("Dragon Fruit", AppColors.red, "assets/dragonfruit.jpg"),
                  fruitItem("Dates", AppColors.orange, "assets/dates.jpg"),
                  fruitItem("Grape Fruit", AppColors.orange, "assets/grapefruit.jpg"),
                  fruitItem("Kiwi", AppColors.green, "assets/kiwi.jpg"),
                  fruitItem("Lychee", AppColors.red, "assets/lychee.jpg"),
                  fruitItem("Pomegranate", AppColors.orange, "assets/Pomegranate.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔥 FUNCTION to create a fruit card with onTap
  Widget fruitItem(String name, Color color, String imgPath) {
    return HomeCardimg(
      label: name,
      color: color,
      img: imgPath,
      onTap: () {
        setState(() {
          selectedFruit = name;
          // selectedColor = color;
        });
      },
    );
  }
}
