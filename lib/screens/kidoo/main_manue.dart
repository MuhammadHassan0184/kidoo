import 'package:get/get_navigation/get_navigation.dart';
import 'package:kidoo/Widgets/drawer.dart';
import 'package:kidoo/services/auth_service.dart';
import 'package:kidoo/Widgets/lesson_list.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class MainManue extends StatelessWidget {
  const MainManue({super.key});

  @override
  Widget build(BuildContext context) {
      // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
      final AuthService _auth = AuthService();

    // Function to handle logout with confirmation
    // ignore: no_leading_underscores_for_local_identifiers, unused_element

    return Scaffold(
      backgroundColor: AppColors.black,
      drawer: CustomDrawer(), 

      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        // 🔥 Only change: proper leading icon to open drawer
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Start Today’s",
              style: TextStyle(
                  color: AppColors.frozi,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Learning Growth",
              style: TextStyle(
                  color: AppColors.frozi,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),

        actions: [
          Image.asset("assets/kidlogo.png"),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    MainCard(),
                    SizedBox(width: 10),
                    MainCard(),
                    SizedBox(width: 10),
                    MainCard(),
                    SizedBox(width: 10),
                    MainCard(),
                    SizedBox(width: 10),
                    MainCard(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Courses",
                    style: TextStyle(
                        color: AppColors.twhite,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/AllCategories");
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                          color: AppColors.frozi,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            // 
            Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            int crossAxisCount = 2; 
            if (width > 600) crossAxisCount = 3; 
            if (width > 900) crossAxisCount = 4; 

            return GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shrinkWrap: true,
              itemCount: 6, 
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: width > 600 ? 3.2 : 2.6, 
              ),
              itemBuilder: (context, index) {
                return LessonList(); 
              },
            );
          },
        ),
      ),
            // 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Video Stories",
                    style: TextStyle(
                        color: AppColors.twhite,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/Stories");
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                          color: AppColors.frozi,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    PlayCard(),
                    SizedBox(width: 10),
                    PlayCard(),
                    SizedBox(width: 10),
                    PlayCard(),
                    SizedBox(width: 10),
                    PlayCard(),
                    SizedBox(width: 10),
                    PlayCard(),
                    SizedBox(width: 10),
                    PlayCard(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
