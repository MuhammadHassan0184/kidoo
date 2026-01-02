import 'package:flutter/material.dart';
import 'package:kidoo/Config/utils/app_colors.dart';

class CustomCommingSoon extends StatelessWidget {
  const CustomCommingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Row(
        children: [
          Icon(Icons.schedule, color: Colors.orange),
          SizedBox(width: 8),
          Text("Coming Soon", style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
      content: Text(
        "This feature is under development and will be available soon.",
        style: TextStyle(fontSize: 14, color: AppColors.info),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.zink
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("OK", style: TextStyle(color:  AppColors.twhite),),
        ),
      ],
    );
  }
  }
