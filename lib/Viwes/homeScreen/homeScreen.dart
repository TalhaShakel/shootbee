import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shootbee/Viwes/Utils/AppColors.dart';
import 'package:shootbee/Viwes/Utils/Service&Function.dart';
import 'package:shootbee/Viwes/Utils/MyText.dart';
import 'package:shootbee/Viwes/homeScreen/postScreen.dart';
import 'package:image_picker/image_picker.dart';

import 'NavbarmainScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Utils.verticalSpacer(20),
                Row(
                  children: [
                    Image.asset(
                      'assets/NameApp.png',
                      height: 31,
                      width: 129,
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/bellIcon.png',
                      height: 41,
                      width: 41,
                    ),
                    Utils.horizontalSpacer(10),
                    Image.asset(
                      'assets/SmsIcon.png',
                      height: 41,
                      width: 41,
                    ),
                  ],
                ),
                Utils.verticalSpacer(34),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 60.65,
                              width: 60.65,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: MyColor.orangeColor, width: 2)),
                            ),
                            Positioned(
                                bottom: 4,
                                right: 0,
                                child: Container(
                                  height: 13.13,
                                  width: 13.13,
                                  decoration: BoxDecoration(
                                      // image: DecorationImage(
                                      //     image: AssetImage('assets/')),
                                      color: MyColor.darkPink,
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                          color: MyColor.darkPink, width: 3)),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add),
                                      iconSize: 10,
                                      color: Colors.red,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        Utils.verticalSpacer(9),
                        MyText(
                          text: 'Add Story',
                          fontsize: 12,
                          fontcolor: Colors.black,
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 110,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60.65,
                                        width: 60.65,
                                        decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/GirlImage.png'),
                                                fit: BoxFit.cover),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: MyColor.lightpink,
                                                width: 2)),
                                      ),
                                      Utils.verticalSpacer(9),
                                      MyText(
                                        text: 'Talha',
                                        fontsize: 12,
                                        fontcolor: Colors.black,
                                      )
                                    ],
                                  ),
                                )),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 4.0,
                            mainAxisExtent: 272),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => PostScreen());
                        },
                        child: Container(
                          height: 272,
                          // width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/ImageGirl.png'),
                                  fit: BoxFit.cover),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/GirlImage.png')),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: MyColor.orangeColor,
                                          width: 2)),
                                ),
                                Utils.horizontalSpacer(8),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: 'Alex_Henderson',
                                      fontsize: 10,
                                      fontcolor: Colors.white,
                                    ),
                                    MyText(
                                        text: 'te5min agoxt',
                                        fontsize: 8,
                                        fontweight: FontWeight.w500,
                                        fontcolor: Colors.white.withOpacity(.7))
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    children: [
                                      MyText(
                                          text: '48',
                                          fontsize: 10,
                                          fontcolor:
                                              Colors.white.withOpacity(.7)),
                                      Icon(Icons.heart_broken_outlined,
                                          size: 10,
                                          color: Colors.white.withOpacity(.7)),
                                    ],
                                  ),
                                ),
                                // Utils.horizontalSpacer(5),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
