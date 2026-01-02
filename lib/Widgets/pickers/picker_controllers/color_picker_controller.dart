// ignore_for_file: deprecated_member_use

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:kidoo/Config/utils/app_colors.dart';
import 'package:flutter/material.dart';

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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.frozi
            ),
            onPressed: () {
              selectedColor = temp;
              colorCtrl.text =
                  "#${selectedColor.value.toRadixString(16).substring(2).toUpperCase()}";
              updateUI?.call();
              Navigator.pop(context);
            },
            child: Text("OK", style: TextStyle(color: AppColors.twhite),),
          )
        ],
      ),
    );
  }
}

