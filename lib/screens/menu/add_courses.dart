import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/app_text_field.dart';
import 'package:kidoo/screens/menu/add_course_letter.dart';

class AddCourses extends StatefulWidget {
  const AddCourses({super.key});

  @override
  State<AddCourses> createState() => _AddCoursesState();
}

class _AddCoursesState extends State<AddCourses>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton( onPressed: () { Get.offNamed("/MainManue"); }, icon: Icon(Icons.arrow_back, color: AppColors.twhite), ),
        title: const Text(
          "Add Course",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      /// TAB BAR ALWAYS VISIBLE
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TabBar(
              controller: controller,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: "none"),
                Tab(text: "letter"),
                Tab(text: "image"),
              ],
            ),
          ),

          /// TAB SCREENS
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                AddCourseNone(),
                AddCourseLetter(),
                // AddCourseImage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class AddCourseNone extends StatelessWidget {
  const AddCourseNone({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text("Title",
              style: TextStyle(color: AppColors.info, fontSize: 19)),
          const SizedBox(height: 10),
          AppTextField(label: "Here"),

          SizedBox(height: 20),

          Text("Color Theme",
              style: TextStyle(color: AppColors.info, fontSize: 19)),
          const SizedBox(height: 10),
          AppTextField(label: "Here"),

         SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.zink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                
              },
              child: const Text(
                "Add",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

