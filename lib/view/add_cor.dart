
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kidoo/Config/app_colors.dart';
import 'package:kidoo/Widgets/home_card.dart';
import 'package:flutter/material.dart';

class AddCor extends StatelessWidget {
  const AddCor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
      backgroundColor: AppColors.bgColor,
      leading: IconButton(
        onPressed: (){
          Get.offNamed("/MainManue");
          },
           icon: Icon(Icons.arrow_back, color: AppColors.twhite,),),
        title: Text("Lesson Tile", style: TextStyle(color: AppColors.twhite, fontWeight: FontWeight.bold,), ), centerTitle: true,
      ),
      body: Column(
        children: [
            Expanded(
              child: GridView(
                padding: EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                children: [
                  HomeCardimg(label: "Lesson Tile", color: AppColors.bgColor),
                  HomeCardimg(label: "Lesson Tile", color: AppColors.bgColor),
                  HomeCardimg(label: "Lesson Tile", color: AppColors.bgColor),
                  HomeCardimg(label: "Lesson Tile", color: AppColors.bgColor),
                  HomeCardimg(label: "Lesson Tile", color: AppColors.bgColor),
                  HomeCardimg(label: "Lesson Tile", color: AppColors.bgColor),
                  HomeCardimg(label: "Lesson Tile", color: AppColors.bgColor),
                  HomeCardimg(label: "Lesson Tile", color: AppColors.bgColor),
                  HomeCardimg(label: "Lesson Tile", color: AppColors.bgColor),
                  HomeCardimg(label: "Lesson Tile", color: AppColors.bgColor),
                ],
              ),
            ),
        ],
      ),
    );
  }
}