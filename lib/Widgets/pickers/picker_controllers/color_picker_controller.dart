// import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// // flutter_colorpicker

// class ColorPickerController {
//   Color selectedColor = Colors.red;

//   final TextEditingController colorCtrl = TextEditingController();

//   void pick(BuildContext context, VoidCallback updateUI) async {
//     Color tempColor = selectedColor;

//     await showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Select Color"),

//         content: SizedBox(
//           width: double.maxFinite,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Color palette only
//                 ColorPicker(
//                   pickerColor: tempColor,
//                   onColorChanged: (color) {
//                     tempColor = color;
//                     colorCtrl.text =
//                         "#${color.value.toRadixString(16).substring(2).toUpperCase()}";
//                     updateUI();
//                   },
//                   paletteType: PaletteType.hsv, // HSV grid
//                   pickerAreaHeightPercent: 1, // Use full height
//                   displayThumbColor: false, // hide thumb circle
//                   enableAlpha: false, // no transparency
//                   hexInputBar: true, // HEX input above palette
//                   showLabel: false, // hide RGB/HSV text
//                 ),
//               ],
//             ),
//           ),
//         ),

// ignore_for_file: deprecated_member_use

//         actions: [
//           TextButton(
//             onPressed: () {
//               selectedColor = tempColor;
//               colorCtrl.text =
//                   "#${selectedColor.value.toRadixString(16).substring(2).toUpperCase()}";
//               updateUI();
//               Navigator.pop(context);
//             },
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerController {
  Color selectedColor = Colors.red;
  final TextEditingController colorCtrl = TextEditingController();

  /// Refresh callback setter
  VoidCallback? updateUI;

  void bindRefresh(VoidCallback callback) {
    updateUI = callback;
  }

  /// When user types HEX manually
  void onHexChanged(String value) {
    if (value.isEmpty) return;

    try {
      String hex = value.replaceAll("#", "").trim();

      if (hex.length == 6) {
        final intColor = int.parse("FF$hex", radix: 16);
        selectedColor = Color(intColor);

        updateUI?.call();
      }
    } catch (_) {
      // ignore wrong Hex input
    }
  }

  /// Open color picker dialog
  void pick(BuildContext context, void Function() refresh) async {
    Color temp = selectedColor;

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Select Color"),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: temp,
            onColorChanged: (c) {
              temp = c;
              colorCtrl.text =
                  "#${c.value.toRadixString(16).substring(2).toUpperCase()}";
              updateUI?.call();
            },
            paletteType: PaletteType.hsv,
            pickerAreaHeightPercent: 1,
            hexInputBar: true,
            showLabel: false,
            enableAlpha: false,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              selectedColor = temp;
              colorCtrl.text =
                  "#${selectedColor.value.toRadixString(16).substring(2).toUpperCase()}";
              updateUI?.call();
              Navigator.pop(context);
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}

