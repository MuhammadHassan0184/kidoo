import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class LessonList extends StatelessWidget {
  final String? img;
  const LessonList({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.fgColor,
          borderRadius: BorderRadius.circular(10),
        ),
      
        child: Row(
          children: [
            // --------- Image / Icon ----------
            Container(
              width: 42,
              height: 42,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                img ?? "assets/imageiconc.png",
                fit: BoxFit.cover,
              ),
            ),
      
            SizedBox(width: 10),
      
            // --------- Title + Subtitle ----------
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Courses Title",
                    style: TextStyle(
                      color: AppColors.twhite,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
      
                 SizedBox(height: 4),
      
                  Text(
                    "Info",
                    style: TextStyle(
                      color: AppColors.info,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

