import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final String label;
  final String? selectedText;
  final Color? selectedColor; // <-- Added this

  const BannerCard({
    super.key,
    required this.label,
    this.selectedText,
    this.selectedColor, // <-- Added this
  });

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
          CircleAvatar(
            radius: 45,
            backgroundColor: selectedColor ?? AppColors.green, // <-- color updates dynamically
            child: Text(
              selectedText ?? "",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.twhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: AppColors.twhite,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback? onTap; // <-- Added this

  const HomeCard({
    super.key,
    required this.label,
    required this.color,
    this.onTap, // <-- Added this
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // <-- Tapping works now
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

