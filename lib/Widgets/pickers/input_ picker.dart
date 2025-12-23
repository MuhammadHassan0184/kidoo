import 'package:flutter/material.dart';
import 'package:kidoo/Config/utils/app_colors.dart';


// ==========================================================
// UNIVERSAL PICKER INPUT WIDGET
// ==========================================================
class PickerInput extends StatelessWidget {
final String label;
final Widget suffix;
final VoidCallback onTap;
final TextEditingController controller;


const PickerInput({
super.key,
required this.label,
required this.suffix,
required this.onTap,
required this.controller,
});


@override
Widget build(BuildContext context) {
return GestureDetector(
onTap: onTap,
child: AbsorbPointer(
child: TextFormField(
  style: TextStyle(
    fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.info
  ),
controller: controller,
decoration: InputDecoration(
hintText: label,
border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(color: AppColors.primary,)
),
suffixIcon: suffix,
),
),
),
);
}
}