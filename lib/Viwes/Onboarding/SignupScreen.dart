import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shootbee/Viwes/AuthScreens/AccountCreationScreen.dart';
import 'package:shootbee/Viwes/Onboarding/OnboardingScreen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/AppColors.dart';
import '../Utils/Service&Function.dart';
import '../Utils/MyButton.dart';
import '../Utils/MyString.dart';
import '../Utils/MyText.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 22, right: 22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_back),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/undraw_Social4.png',
                      height: 170.h,
                      fit: BoxFit.fitHeight,
                    ),
                    Utils.verticalSpacer(18),
                    MyText(
                      text: MyString.letsInText,
                      fontsize: 48,
                      fontweight: FontWeight.bold,
                    ),
                    Utils.verticalSpacer(18),
                    ContanierW(
                      height: 48,
                      icon: "assets/facebook.png",
                      spacer: 14.w,
                      text: MyString.continueWithF,
                    ),
                    Utils.verticalSpacer(16),
                    ContanierW(
                      spacer: 14.w,
                      height: 48,
                      icon: "assets/google.png",
                      text: MyString.continueWithGoogle,
                    ),
                    Utils.verticalSpacer(16),
                    ContanierW(
                      spacer: 14.w,
                      height: 48,
                      icon: "assets/Apple.png",
                      text: MyString.continueWApple,
                    ),
                    Utils.verticalSpacer(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .4,
                          child: const Divider(
                            thickness: 2,
                          ),
                        ),
                        MyText(text: 'or'),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: const Divider(
                              thickness: 2,
                            ))
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    20.h.heightBox,
                    MyButton(
                        bordercolor: Colors.transparent,
                        buttontext: MyString.signWithPassword,
                        onPressed: () {
                          Get.to(() => AccountCreationScreen());
                        }),
                    Utils.verticalSpacer(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: MyString.dinNotAccount,
                          fontsize: 14,
                          fontcolor: const Color(0xff9E9E9E),
                          fontweight: FontWeight.w400,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => AccountCreationScreen());
                          },
                          child: MyText(
                            text: MyString.signUpText,
                            fontsize: 14,
                            fontcolor: MyColor.darkPink,
                            fontweight: FontWeight.w600,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                20.h.heightBox, 
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContanierW extends StatelessWidget {
  final icon;
  final double? height, width;
  final double spacer;
  final String text;
  const ContanierW({
    required this.icon,
    this.text = '',
    this.height,
    this.width,
    this.spacer = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: const Color(0xffEEEEEE),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon.toString(),
            height: 24.h,
          ),
          Utils.horizontalSpacer(spacer),
          MyText(text: text)
        ],
      ),
    );
  }
}
