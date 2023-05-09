import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Controllers/MainControllor copy.dart';

class ImageSelectorPage extends StatelessWidget {
  File? imageFile;
  ImagePicker imagePicker = ImagePicker();

  ImagePickerProfile imagePickerController = Get.put(ImagePickerProfile());

  ImageSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Image Picker Page",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Obx(() => CircleAvatar(
                      radius: 80,
                      backgroundImage: imagePickerController
                                  .isImagePathSet.value ==
                              true
                          ? FileImage(
                                  File(imagePickerController.imagePath.value))
                              as ImageProvider
                          : const AssetImage("assets/images/profilepic.png"),
                    )),
                Positioned(
                  bottom: 0,
                  child: InkWell(
                    child: const Icon(
                      Icons.camera,
                      color: Colors.white,
                      // size: ,
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => bottomSheet(context),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Select or Capture Photo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  children: const [
                    Icon(
                      Icons.camera,
                      color: Colors.purple,
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.camera, context);
                },
              ),
              SizedBox(
                width: size.width * 0.4,
              ),
              InkWell(
                child: Column(
                  children: const [
                    Icon(
                      Icons.image,
                      color: Colors.deepPurple,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.gallery, context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source, BuildContext context) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    imageFile = File(pickedImage!.path);

    imagePickerController.setImagePath(imageFile!.path);
    Navigator.pop(context);
  }
}
