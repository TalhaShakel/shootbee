import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shootbee/Viwes/Onboarding/SignupScreen.dart';

import '../Viwes/Onboarding/OnboardingScreen.dart';
import '../Viwes/Onboarding/StartScreen.dart';
import '../Viwes/Utils/AppColors.dart';
import '../Viwes/Utils/MyString.dart';

class MainControllor extends GetxController {
  var selectedDate = DateTime.now().obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        //initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select DOB',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 5))))) {
      return true;
    }
    return false;
  }
}

class isCheckedControllor extends GetxController {}

class ImagePickerProfile extends GetxController {
  var imagePath = "".obs;
  var isImagePathSet = false.obs;

  void setImagePath(String path) {
    imagePath.value = path;
    isImagePathSet.value = true;
  }
}

class onboardingControllor extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastpage => selectedPageIndex.value == Onboard.length - 1;
  var pagecontrollor = PageController();

  ForwordAction() {
    if (isLastpage) {
      Get.to(() => SignUpScreen());
    } else
      pagecontrollor.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  final List<OnboardModel> Onboard = [
    OnboardModel(
        image: 'assets/undrawsocial1.png', title: MyString.connectWithFrient),
    OnboardModel(image: 'assets/undraw2.png', title: MyString.makeWithFriend),
    OnboardModel(image: 'assets/undraw3.png', title: MyString.expressYourSelf)
  ];
}
