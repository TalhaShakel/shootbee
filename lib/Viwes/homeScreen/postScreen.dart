import 'package:flutter/material.dart';

import '../Utils/AppColors.dart';
import '../Utils/Service&Function.dart';
import '../Utils/MyText.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width * .4,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/ImageGirl.png'), fit: BoxFit.cover),
            color: Colors.red,
            borderRadius: BorderRadius.circular(0)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 80, left: 17, right: 17, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Image(
                    image: AssetImage('assets/CrossIcon.png'),
                    height: 24,
                    width: 24,
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage('assets/threedotIcons.png'),
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/GirlImage.png')),
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: MyColor.orangeColor, width: 2)),
                  ),
                  Utils.horizontalSpacer(18),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Alex_Henderson',
                        fontsize: 18,
                        fontweight: FontWeight.bold,
                        fontcolor: Colors.white,
                      ),
                      Utils.verticalSpacer(4),
                      MyText(
                          text: 'te5min agoxt',
                          fontsize: 14,
                          fontweight: FontWeight.w500,
                          fontcolor: Colors.white)
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText(
                            text: '3.5K',
                            fontsize: 14,
                            fontweight: FontWeight.w500,
                            fontcolor: Colors.white),
                        Utils.horizontalSpacer(10),
                        Image.asset(
                          'assets/SmsIcon.png',
                          color: Colors.white,
                          height: 20,
                          width: 20,
                        ),
                        Utils.horizontalSpacer(24),
                        MyText(
                            text: '3.5M',
                            fontsize: 10,
                            fontcolor: Colors.white.withOpacity(.7)),
                        Utils.horizontalSpacer(10),
                        Image.asset(
                          'assets/Heart.png',
                          color: Colors.white,
                          height: 20,
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  // Utils.horizontalSpacer(5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
