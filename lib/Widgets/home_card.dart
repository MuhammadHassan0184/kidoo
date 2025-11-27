import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class HomeCardimg extends StatelessWidget {
  final String label;
  final Color color;
  final String img;
  final VoidCallback? onTap;

  const HomeCardimg({
    super.key,
    required this.label,
    required this.color,
    required this.img,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // 🔥 working tap
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          color: color, // 🔵 background color of the circle container
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔴 Image in Circle
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(img),
            ),

            const SizedBox(height: 10),

            // 🍎 Fruit name
            Text(
              label,
              style: TextStyle(
                color: AppColors.twhite,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}




// ignore: must_be_immutable
// ignore: must_be_immutable

class HomeCard extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback? onPressed;

  const HomeCard({
    super.key,
    required this.label,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: AppColors.twhite,
            ),
          ),
        ),
      ),
    );
  }
}


