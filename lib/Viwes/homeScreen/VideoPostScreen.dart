import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/AppColors.dart';
import '../Utils/Service&Function.dart';
import '../Utils/MyText.dart';

class VideoPostScreen extends StatelessWidget {
  const VideoPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width * .4,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/ImageGirl.png'), fit: BoxFit.cover),
          color: Colors.red,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 80, left: 17, right: 17, bottom: 30),
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
              Utils.verticalSpacer(60),
              Center(
                  child: Image.asset(
                'assets/Playbutton.png',
                height: 90,
                width: 90,
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/Heart.png',
                        color: MyColor.orangeColor,
                        height: 28.33,
                        width: 28.33,
                      ),
                      Utils.verticalSpacer(8),
                      MyText(
                        text: '1.5M',
                        fontsize: 14,
                        fontweight: FontWeight.w500,
                        fontcolor: Colors.white.withOpacity(.7),
                      ),
                      Utils.verticalSpacer(14),
                      Image.asset(
                        'assets/SmsIcon.png',
                        color: Colors.white,
                        height: 28.33,
                        width: 28.33,
                      ),
                      Utils.verticalSpacer(8),
                      MyText(
                        text: '1.5M',
                        fontsize: 14,
                        fontweight: FontWeight.w500,
                        fontcolor: Colors.white.withOpacity(.7),
                      ),
                      Utils.verticalSpacer(20),
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
                            border: Border.all(
                                color: MyColor.orangeColor, width: 2)),
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
                      //const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 16),
                        child: Container(
                          height: 27,
                          width: 66,
                          decoration: BoxDecoration(
                              color: MyColor.orangeColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: MyText(
                                text: 'Fallow',
                                fontsize: 12,
                                fontweight: FontWeight.w700,
                                fontcolor: Colors.white),
                          ),
                        ),
                      ),
                      Spacer(),
                      // Utils.horizontalSpacer(5),
                      Image.asset(
                        'assets/Send.png',
                        height: 28.33,
                        width: 28.33,
                      )
                    ],
                  ),
                  Utils.verticalSpacer(16),
                  Row(
                    children: [
                      Container(
                        height: 23,
                        width: 23,
                        margin: EdgeInsets.only(left: 10, right: 5),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/GirlImage.png')),
                          shape: BoxShape.circle,
                        ),
                      ),
                      MyText(
                        text: 'Music by Justin Bieber',
                        fontsize: 8,
                        fontweight: FontWeight.w500,
                        fontcolor: Colors.white.withOpacity(.7),
                      ),
                      Spacer(),
                      // Container(
                      //   height: 28.33,
                      //   width: 28.33,
                      //   decoration: const BoxDecoration(
                      //       color: Colors.white,
                      //       shape: BoxShape.circle,
                      //       image: DecorationImage(

                      //           image: AssetImage('assets/threedot.png',))),
                      // )

                      Image.asset(
                        'assets/DotedCircle.png',
                        height: 28.33,
                        width: 28.33,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
