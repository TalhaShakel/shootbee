import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static verticalSpacer(double value) => SizedBox(
        height: value,
      );

  static horizontalSpacer(double value) => SizedBox(
        width: value,
      );
}

Future selectVideo() async {
  try {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      return pickedFile;
    } else {
      Get.snackbar('No video selected', '');
      return null;
    }
  } catch (e) {
    Get.snackbar('Error selecting video', e.toString());
    return null;
  }
}
