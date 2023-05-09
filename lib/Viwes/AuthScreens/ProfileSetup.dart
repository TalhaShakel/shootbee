import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shootbee/Viwes/homeScreen/homeScreen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Controllers/MainControllor copy.dart';
import '../Utils/AppColors.dart';
import '../Utils/Service&Function.dart';
import '../Utils/MyButton.dart';
import '../Utils/MyString.dart';
import '../Utils/MyText.dart';
import '../Utils/MyTextFromField.dart';
import '../homeScreen/NavbarmainScreen.dart';

class ProfileSetupScreen extends StatelessWidget {
  File? imageFile;
  ImagePicker imagePicker = ImagePicker();

  TextEditingController nameControllor = TextEditingController();
  TextEditingController nicknameControllor = TextEditingController();
  TextEditingController emailControllor = TextEditingController();
  ImagePickerProfile imagePickerController = Get.put(ImagePickerProfile());
  final controllor = MainControllor();
  final profileController = Get.put(MainControllor());
  // var ptext = ProfileStrings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: ProfileStrings.fillYourProfile.text.color(Vx.black).make(),
          leading: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.arrow_back,
              color: Vx.black,
              size: 30,
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Utils.verticalSpacer(10),
                profileImage(context),
                Utils.verticalSpacer(35),
                MyTextField(
                    hintText: MyString.fullNameText,
                    controller: nameControllor),
                Utils.verticalSpacer(18),
                MyTextField(
                    hintText: MyString.nickNameT,
                    controller: nicknameControllor),
                Utils.verticalSpacer(18),
                Container(
                  height: 58,
                  decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 45,
                    ),
                    child: Row(
                      children: [
                        Obx(() => Text(
                              DateFormat("dd-MM-yyyy")
                                  .format(controllor.selectedDate.value)
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(.5)),
                            )),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            controllor.chooseDate();
                          },
                          icon: Image.asset('assets/Calendar.png'),
                          color: Colors.black.withOpacity(.5),
                        ),
                      ],
                    ),
                  ),
                ),
                Utils.verticalSpacer(18),
                MyTextField(
                    hintText: MyString.emailText,
                    controller: emailControllor,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image(
                        image: AssetImage('assets/Message.png'),
                        color: Color(0xff9E9E9E),
                      ),
                    )),
                Utils.verticalSpacer(18),
                Container(
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Utils.verticalSpacer(18),
                const DropDownGender(),
                Utils.verticalSpacer(40),
                MyButton(
                    buttontext: MyString.nextbuttonText,
                    onPressed: () {
                      Get.to(() => BottomNavBar());
                    }),
                20.h.heightBox,
              ],
            ),
          )),
        ));
  }

  Future<void> takePhoto(ImageSource source, BuildContext context) async {
    final pickedImage = await imagePicker.pickImage(
      source: source,
    );

    imageFile = File(pickedImage!.path);

    imagePickerController.setImagePath(imageFile!.path);
    Navigator.pop(context);
  }

  Widget profileImage(BuildContext context) {
    return Stack(
      children: <Widget>[
        Obx(
          () => CircleAvatar(
            radius: 70,
            backgroundImage: imagePickerController.isImagePathSet.value == true
                ? FileImage(File(imagePickerController.imagePath.value))
                    as ImageProvider
                : const AssetImage("assets/profilePerson.png"),
            backgroundColor: Colors.transparent,
          ),
        ),
        Positioned(
            bottom: 5,
            right: 0,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: MyColor.darkPink,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MyColor.darkPink, width: 3)),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => buttonsheet(context));
                  },

                  child: const Icon(
                    Icons.edit,
                    size: 25,
                    color: Colors.white,
                  ),
                  // iconSize: 15,
                ),
              ),
            ))
      ],
    );
  }

  Widget buttonsheet(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
            text: MyString.chooseProfileT,
            fontsize: 20,
          ),
          Utils.verticalSpacer(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    takePhoto(ImageSource.camera, context);
                  },
                  icon: const Icon(Icons.camera)),
              MyText(text: MyString.cemeraT),
              Utils.horizontalSpacer(60),
              IconButton(
                  onPressed: () {
                    takePhoto(ImageSource.gallery, context);
                  },
                  icon: const Icon(Icons.browse_gallery)),
              MyText(text: MyString.galleryT),
            ],
          ),
        ],
      ),
    );
  }
}

class DropDownGender extends StatefulWidget {
  const DropDownGender({super.key});

  @override
  State<DropDownGender> createState() => _DropDownGenderState();
}

class _DropDownGenderState extends State<DropDownGender> {
  List dropDownListData = [
    {"title": "Male", "value": "1"},
    {"title": "Female", "value": "2"},
  ];
  String Gender = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 45, right: 20),
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xffFAFAFA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: Gender,
          isDense: true,
          isExpanded: true,
          menuMaxHeight: 300,
          items: [
            DropdownMenuItem(
              value: '',
              child: MyText(
                text: 'Select Gender',
                fontsize: 14,
                fontweight: FontWeight.w400,
                fontcolor: const Color(0xff9E9E9E),
              ),
            ),
            ...dropDownListData.map<DropdownMenuItem<String>>((selectGender) {
              return DropdownMenuItem(
                child: Text(selectGender['title']),
                value: selectGender['value'],
              );
            }).toList(),
          ],
          onChanged: (newGender) {
            setState(() {
              Gender = newGender!;
              print(newGender);
            });
            if (Gender == "") {
              print("Please Select a course");
            } else {
              print("Selected Course Value $Gender");
            }
          },
        ),
      ),
    );
  }
}
