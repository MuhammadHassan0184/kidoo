
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  String label;
  IconData? icon;
  // TextEditingController controller;
   final String? Function(String?)? validator;
   AppTextField({super.key, 
   required this.label,  
  //  required this.controller,
   this.icon,
   this.validator,
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,
      validator: validator,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.twhite
      ),
          decoration: InputDecoration(
            prefixIcon: icon == null ? null : Icon(icon),
            hint: Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.info),),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.primary, 
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.primary, 
      ),
    ),
          ),
          );
  }
}