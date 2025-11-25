// import 'package:kidoo/Config/utils/app_colors.dart';
// import 'package:kidoo/Widgets/home_card.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AllCategories extends StatelessWidget {
//   const AllCategories({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.black,
//       appBar: AppBar(
//         backgroundColor: AppColors.bgColor,
//         leading: IconButton(
//           onPressed: () {
//             Get.offNamed("/MainManue");
//           },
//           icon: Icon(Icons.arrow_back, color: AppColors.twhite),
//         ),
//         title: Text(
//           "All Courses",
//           style: TextStyle(
//             color: AppColors.twhite,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       // ------------------ BODY ------------------
//       body: 
//       Padding(
//         padding: const EdgeInsets.all(15),
//         child: GridView(
//           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 250,
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//             childAspectRatio: 1, 
//           ),
//           children:  [
            // HomeCard(label: "Colors", color: AppColors.colors, onPressed: () {
            //   Get.toNamed("/Colortask");
            // },),
            // HomeCard(label: "A_B_C", color: AppColors.abc, onPressed: () {
            //   Get.toNamed("/Alphabets");
            // },),
            // HomeCardimg(label: "Fruits", color: AppColors.fruits, img: "assets/fruits.jpg", onPressed: () {
            //   Get.toNamed("/Fruits");
            // },),
            // HomeCardimg(label: "Vegetables", color: AppColors.vegetable, img: "assets/veges.jpg", onPressed: () {
            //   Get.toNamed("/Vegitable");
//             },),
            
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/home_card.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: () => Get.offNamed("/MainManue"),
          icon: Icon(Icons.arrow_back, color: AppColors.twhite),
        ),
        title: Text(
          "All Courses",
          style: TextStyle(
            color: AppColors.twhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("courses")
              .orderBy("createdAt", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final data = snapshot.data!.docs;

            if (data.isEmpty) {
              return Center(
                child: Text(
                  "No Courses Added Yet",
                  style: TextStyle(color: AppColors.twhite, fontSize: 18),
                ),
              );
            }

            return GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, i) {
                final course = data[i];

                String title = course["title"];
                String hex = course["themeColor"];

                return HomeCard(
                  label: title,
                  color: hexToColor(hex),
                  onPressed: () {
                    // -----------------------------------------------------
                    // 📌 Navigation Control (ONLY 4 titles allowed)
                    // -----------------------------------------------------
                    switch (title) {
                      case "colors":
                        Get.toNamed("/Colortask");
                        break;

                      case "fruits":
                        Get.toNamed("/Fruits");
                        break;

                      case "alphabets":
                        Get.toNamed("/Alphabets");
                        break;

                      case "vegetables":
                        Get.toNamed("/Vegitable");
                        break;

                      default:
                        Get.snackbar(
                          "Not Found",
                          "This course does not exist in the app",
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}


// -----------------------------------------------------------
// 🎨 HEX → COLOR Converter
// -----------------------------------------------------------

Color hexToColor(String code) {
  try {
    code = code.replaceAll("#", "").trim();

    if (code.length == 6) {
      return Color(int.parse("FF$code", radix: 16));
    }

    if (code.length == 3) {
      final r = code[0] + code[0];
      final g = code[1] + code[1];
      final b = code[2] + code[2];
      return Color(int.parse("FF$r$g$b", radix: 16));
    }

    return const Color(0xFF676767);
  } catch (e) {
    return const Color(0xFF676767);
  }
}
