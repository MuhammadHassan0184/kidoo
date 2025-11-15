
import 'package:flutter/material.dart';
import 'package:kidoo/Config/app_colors.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  String label;
  IconData? icon;
  TextEditingController controller;
   final String? Function(String?)? validator;
   AppTextField({super.key, 
   required this.label,  
   required this.controller,
   this.icon,
   this.validator,
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
          decoration: InputDecoration(
            prefixIcon: icon == null ? null : Icon(icon),
            hint: Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.primary, 
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.secondary, 
      ),
    ),
          ),
          );
  }
}