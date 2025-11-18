import 'package:flutter/material.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/app_text_field.dart';

class AddCourseLetter extends StatelessWidget {
  const AddCourseLetter({super.key});

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
          const SizedBox(height: 20),
          Text("Letter",
              style: TextStyle(color: AppColors.info, fontSize: 19)),
          const SizedBox(height: 10),
          AppTextField(label: "Enter Letter"),

          SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.zink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
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
