import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeCardimg extends StatelessWidget {
  String label;
  Color color;
  String? img;
  VoidCallback? onPressed;
   HomeCardimg({super.key,
   required this.label,
   required this.color,
    this.img,
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
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 85,
                    height: 85,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black
                    ),
                    child: 
                    img != null
                  ? Image.asset( img!, fit: BoxFit.cover,) : const Icon(
                      Icons.image_not_supported,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 10,),
                Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: AppColors.twhite),),
              ],),
            ),
    );
  }
}

// ignore: must_be_immutable
class HomeCard extends StatelessWidget {
  String label;
  Color color;
  VoidCallback? onPressed;
   HomeCard({super.key,
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
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(label, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: AppColors.twhite),),
              ],),
            ),
    );
  }
}