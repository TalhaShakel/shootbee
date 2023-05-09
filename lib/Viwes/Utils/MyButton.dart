import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shootbee/Viwes/Utils/AppColors.dart';

import '../../Controllers/MainControllor copy.dart';
import 'MyText.dart';

class MyButton extends StatelessWidget {
  final dynamic buttontext;
  final VoidCallback? onPressed;
  final Color textcolor, bordercolor, backgroundcolor;
  final double fontsize;
  final FontWeight fontweight;
  final double radius, height, width;
  final TextAlign textAlignment;
  MyButton(
      {required this.buttontext,
      required this.onPressed,
      this.textcolor = Colors.white,
      this.backgroundcolor = const Color(0xffED4FE7),
      this.fontsize = 16,
      this.fontweight = FontWeight.bold,
      this.radius = 25,
      this.height = 52,
      this.width = double.infinity,
      this.bordercolor = Colors.transparent,
      this.textAlignment = TextAlign.justify,
      super.key});

  final controllor = MainControllor();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: const LinearGradient(
            colors: [Color(0xffED4FE7), Color(0xffA0309C)],
            stops: [0, 1.0],
            begin: Alignment.center,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 10,
              blurStyle: BlurStyle.normal,
              offset: Offset(0, 4),
            ),
          ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            // elevation: 8,
            backgroundColor: Colors.transparent,
            // backgroundColor: backgroundcolor,
            side: BorderSide(width: 4, color: bordercolor),
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            )),
        onPressed: onPressed,
        child: MyText(
          textAlignment: textAlignment,
          text: buttontext,
          fontsize: fontsize,
          fontcolor: textcolor,
          fontweight: fontweight,
        ),
      ),
    );
  }
}
