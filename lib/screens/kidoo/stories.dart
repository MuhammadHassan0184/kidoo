import 'package:flutter/material.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/cards.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: () {
            // Get.offNamed("/Home");
          },
          icon: Icon(Icons.arrow_back, color: AppColors.twhite),
        ),
        title: Text(
          "Stories",
          style: TextStyle(
            color: AppColors.twhite,
            fontWeight: FontWeight.bold,
            fontSize: width * 0.05, 
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            // ✅ Horizontal scroll section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: width * 0.03),
                    child:  MainCard(),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width < 600? 2  : width < 900 ? 3  : 4, 
                  mainAxisSpacing: height * 0.015,
                  crossAxisSpacing: width * 0.03,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) => PlayCardB(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
