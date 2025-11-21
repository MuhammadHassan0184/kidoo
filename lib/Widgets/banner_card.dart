import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BannerCard extends StatelessWidget {
  String label;
   BannerCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.bannercolor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 40, backgroundColor: AppColors.green,),
                  SizedBox(height: 10,),
                  Text(label, style: TextStyle(color: AppColors.twhite, fontSize: 20, fontWeight: FontWeight.bold),)
                ],
              ),
            );
  }
}