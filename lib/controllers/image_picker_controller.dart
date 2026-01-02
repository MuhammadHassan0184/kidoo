// ignore_for_file: body_might_complete_normally_nullable, unnecessary_import

import 'dart:typed_data';
import 'package:flutter/foundation.dart'; // kIsWeb
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

//  If you already have a crop controller, import it here
// import 'package:kidoo/Widgets/pickers/crop_controller.dart';

class ImagePickerController {
  Uint8List? webImageBytes; // ✅ Web image bytes
  String? imagePath;       // ✅ Mobile image path

  final TextEditingController imageCtrl = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  /// Pick image (crop works only on mobile)
  Future<void> pick(BuildContext context, {bool crop = true}) async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        debugPrint("Image picking cancelled");
        return;
      }

      // =========================
      //  WEB
      // =========================
      if (kIsWeb) {
        webImageBytes = await pickedFile.readAsBytes();
        imageCtrl.text = pickedFile.name;

        debugPrint("Web image picked: ${pickedFile.name}");
        return;
      }

      // =========================
      //  MOBILE (Android / iOS)
      // =========================
      String filePath = pickedFile.path;

      if (crop) {
        //  Uncomment if you have crop controller
        // final croppedPath =
        //     await cropCtrl.cropImage(filePath, context: context);
        // if (croppedPath != null) filePath = croppedPath;
      }

      imagePath = filePath;
      imageCtrl.text = path.basename(filePath);

      debugPrint("Mobile image picked: ${imageCtrl.text}");
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  /// Clear selected image
  void clear() {
    webImageBytes = null;
    imagePath = null;
    imageCtrl.clear();
  }

  Future<String?> uploadImageToFirebas(String s) async {}
}
