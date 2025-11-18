import 'package:flutter/material.dart';
import 'package:kidoo/Config/utils/app_colors.dart';

// ignore: must_be_immutable
class MainCard extends StatelessWidget {
  String? img;
   MainCard({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
              padding: EdgeInsets.all(10),
              width: 170,
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: 
                    img != null ? Image.asset( img!, fit: BoxFit.cover,) :  Image.asset("assets/imageicon.png", fit: BoxFit.fill,),
                  ),
                  SizedBox(height: 8,),
                  Text("Book Title here jk jd..", style: TextStyle(color: AppColors.twhite, fontSize: 15),)
                ],
              ),
            ),
    );
  }
}

// ignore: must_be_immutable
class PlayCard extends StatelessWidget {
  final String? img;
  const PlayCard({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 160, // fixed width for horizontal scroll use
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // ✅ important for Row layout
          children: [
            Container(
              height: 170, // ✅ fixed height works in both GridView & Row
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: img != null
                  ? Image.asset(img!, fit: BoxFit.cover)
                  : Image.asset("assets/imageicon.png", fit: BoxFit.cover),
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Book Title nk oijm n n n n nj nj",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                      Text("category",
                      maxLines: 1,
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                    ],
                  ),
                ),
                Icon(Icons.play_circle, color: AppColors.frozi ,size: 35,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PlayCardB extends StatelessWidget {
  String? img;
   PlayCardB({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: 
              img != null ? Image.asset(img!, fit: BoxFit.cover): 
                  Image.asset("assets/imageicon.png", fit: BoxFit.cover),
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Book Title nk oijm n n n n nj nj",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                      Text("category",
                      maxLines: 1,
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                    ],
                  ),
                ),
                Icon(Icons.play_circle, color: AppColors.frozi ,size: 35,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// InkWell(
//       onTap: () {
        
//       },
//       child: Container(
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: AppColors.bgColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//   children: [
//     Expanded(
//       child: Container(
//         width: double.infinity,
//         clipBehavior: Clip.antiAlias,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: img != null
//             ? Image.asset(img!, fit: BoxFit.cover)
//             : Image.asset("assets/imageicon.png", fit: BoxFit.cover),
//       ),
//     ),
//     const SizedBox(height: 8),
//     Row(
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Book Title here jk jd", style: TextStyle(color: AppColors.twhite, fontSize: 13)),
//             Text("category", style: TextStyle(color: AppColors.twhite, fontSize: 13)),
//           ],
//         ),
//         const SizedBox(width: 7),
//         Icon(Icons.play_circle, color: AppColors.frozi ,size: 35,)
//       ],
//     ),
//   ],
// ),

//             ),
//     );