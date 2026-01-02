import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final IconData? suicon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  // NEW — suffix tap callback
  final VoidCallback? onSuffixTap;

  const AppTextField({
    super.key,
    required this.label,
    this.icon,
    this.suicon,
    this.validator,
    this.controller,
    this.onSuffixTap, // added
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.twhite,
      ),
      decoration: InputDecoration(
        prefixIcon: icon == null ? null : Icon(icon, color: AppColors.info),

        /// Suffix Icon Added (For Color Picker)
        suffixIcon: suicon == null
            ? null
            : GestureDetector(
                onTap: onSuffixTap,
                child: Icon(suicon, color: AppColors.info),
              ),

        hintText: label,
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.info,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.zink),
        ),
      ),
    );
  }
}