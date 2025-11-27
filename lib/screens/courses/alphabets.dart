// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kidoo/Config/utils/app_colors.dart';
// import 'package:kidoo/Widgets/banner_card.dart';

// class Alphabets extends StatefulWidget {
//   const Alphabets({super.key});

//   @override
//   State<Alphabets> createState() => _AlphabetsState();
// }

// class _AlphabetsState extends State<Alphabets> {
//   String selectedAlphabet = "";
//   Color selectedColor = AppColors.green;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.black,
//       appBar: AppBar(
//         backgroundColor: AppColors.bgColor,
//         leading: IconButton(
//           onPressed: () {
//             Get.offNamed("/AllCategories");
//           },
//           icon: Icon(Icons.arrow_back, color: AppColors.twhite),
//         ),
//         title: Text(
//           "Alphabets",
//           style: TextStyle(
//             color: AppColors.twhite,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             // 🔴 BANNER WITH SELECTED ALPHABET
//             BannerCard(
//               label: "Alphabets",
//               selectedText: selectedAlphabet,
//               selectedColor: selectedColor,
//             ),

//             const SizedBox(height: 20),

//             Expanded(
//               child: GridView(
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                   maxCrossAxisExtent: 250,
//                   mainAxisSpacing: 16,
//                   crossAxisSpacing: 16,
//                   childAspectRatio: 1,
//                 ),

//                 children: [
//                   alphabetItem("A", AppColors.red),
//                   alphabetItem("B", AppColors.yellow),
//                   alphabetItem("C", AppColors.green),
//                   alphabetItem("D", AppColors.orange),
//                   alphabetItem("E", AppColors.blue),
//                   alphabetItem("F", AppColors.violet),
//                   alphabetItem("G", AppColors.pink),
//                   alphabetItem("H", AppColors.skin),
//                   alphabetItem("I", AppColors.yellow),
//                   alphabetItem("J", AppColors.green),
//                   alphabetItem("K", AppColors.orange),
//                   alphabetItem("L", AppColors.blue),
//                   alphabetItem("M", AppColors.violet),
//                   alphabetItem("N", AppColors.pink),
//                   alphabetItem("O", AppColors.skin),
//                   alphabetItem("P", AppColors.blue),
//                   alphabetItem("Q", AppColors.green),
//                   alphabetItem("R", AppColors.orange),
//                   alphabetItem("S", AppColors.pink),
//                   alphabetItem("T", AppColors.skin),
//                   alphabetItem("U", AppColors.red),
//                   alphabetItem("V", AppColors.yellow),
//                   alphabetItem("W", AppColors.blue),
//                   alphabetItem("X", AppColors.green),
//                   alphabetItem("Y", AppColors.orange),
//                   alphabetItem("Z", AppColors.violet),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // 🔵 FUNCTION TO ADD ONTAP EASILY
//   Widget alphabetItem(String letter, Color color) {
//     return HomeCard(
//       label: letter,
//       color: color,
//       onTap: () {
//         setState(() {
//           selectedAlphabet = letter;
//           selectedColor = color;
//         });
//       },
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:kidoo/Widgets/banner_card.dart';
import 'package:kidoo/controllers/courses_controllers/alphabets_controller.dart';

class Alphabets extends StatelessWidget {
  Alphabets({super.key});

  final AlphabetsController controller = Get.put(AlphabetsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: () => Get.offNamed("/AllCategories"),
          icon: Icon(Icons.arrow_back, color: AppColors.twhite),
        ),
        title: Text(
          "Alphabets",
          style: TextStyle(
            color: AppColors.twhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => BannerCard(
                label: "Alphabets",
                selectedText: controller.selectedName.value,
                selectedColor: controller.selectedColor.value,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: controller.getAlphabets(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
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

                  final lessons = snapshot.data!.docs;

                  if (lessons.isEmpty) {
                    return Center(
                      child: Text(
                        "No Alphabets Added Yet",
                        style: TextStyle(color: AppColors.twhite, fontSize: 18),
                      ),
                    );
                  }

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1,
                        ),
                    itemCount: lessons.length,
                    itemBuilder: (context, index) {
                      final doc = lessons[index];
                      final title = doc["title"];
                      final theme = doc["theme"];
                      final color = controller.parseColor(theme);

                      return GestureDetector(
                        onTap: () => controller.selectAlphabet(title, color),
                        onLongPress: () =>
                            controller.showAlphabetDialog(context, doc),
                        child: HomeCard(
                          label: title,
                          color: color,
                          onTap: () => controller.selectAlphabet(title, color),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
