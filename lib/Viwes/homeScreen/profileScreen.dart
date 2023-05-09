import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shootbee/Viwes/Utils/AppColors.dart';
import 'package:shootbee/Viwes/Utils/Service&Function.dart';
import 'package:shootbee/Viwes/Utils/MyText.dart';

class profileScreen extends StatefulWidget {
  profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: MyText(
          text: 'Alex Henderson',
          fontsize: 24,
          fontweight: FontWeight.w700,
        ),
        leading: const Icon(
          Icons.arrow_back,
          size: 25,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/ImageGirl.png'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                  border: Border.all(color: MyColor.hardpink)),
            ),
            Utils.verticalSpacer(5),
            MyText(
              text: 'Alex Henderson',
              fontsize: 18.sp,
              fontweight: FontWeight.w600,
              fontcolor: Colors.black,
            ),
            MyText(
              text: 'Photographer',
              fontsize: 12.sp,
              fontweight: FontWeight.w500,
              fontcolor: Colors.black.withOpacity(.8),
            ),
            Utils.verticalSpacer(10),
            MyText(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Pharetra aliquam, congue habitasse tortor. Fringilla.',
              fontsize: 12.sp,
              fontweight: FontWeight.w400,
              fontcolor: Colors.black.withOpacity(.6),
            ),
            Utils.verticalSpacer(6),
            MyText(
              text: 'www.yourdomain.com',
              fontsize: 12.sp,
              fontweight: FontWeight.w400,
              fontcolor: MyColor.blue,
            ),
            Utils.verticalSpacer(22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    MyText(
                        text: '367',
                        fontsize: 20.sp,
                        fontweight: FontWeight.w600,
                        fontcolor: Colors.black),
                    MyText(
                        text: 'Posts',
                        fontsize: 10.sp,
                        fontweight: FontWeight.w400,
                        fontcolor: Colors.black),
                  ],
                ),
                Column(
                  children: [
                    MyText(
                        text: '2.6M',
                        fontsize: 20.sp,
                        fontweight: FontWeight.w600,
                        fontcolor: Colors.black),
                    MyText(
                        text: 'Followers',
                        fontsize: 10.sp,
                        fontweight: FontWeight.w400,
                        fontcolor: Colors.black),
                  ],
                ),
                Column(
                  children: [
                    MyText(
                        text: '1.6K',
                        fontsize: 20.sp,
                        fontweight: FontWeight.w600,
                        fontcolor: Colors.black),
                    MyText(
                        text: 'Following',
                        fontsize: 10.sp,
                        fontweight: FontWeight.w400,
                        fontcolor: Colors.black),
                  ],
                ),
                Column(
                  children: [
                    MyText(
                        text: '4.6M',
                        fontsize: 20.sp,
                        fontweight: FontWeight.w600,
                        fontcolor: Colors.black),
                    MyText(
                        text: 'Likes',
                        fontsize: 10.sp,
                        fontweight: FontWeight.w400,
                        fontcolor: Colors.black),
                  ],
                )
              ],
            ),
            Utils.verticalSpacer(18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * .40,
                    decoration: BoxDecoration(
                        border: Border.all(color: MyColor.hardpink, width: 2),
                        color: MyColor.hardpink,
                        borderRadius: BorderRadius.circular(100)),
                    child: //Image.asset(name),
                        Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset(name),
                        MyText(
                            text: 'Follow',
                            fontsize: 18,
                            fontweight: FontWeight.w700,
                            fontcolor: Colors.white),
                      ],
                    )),
                Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * .40,
                    decoration: BoxDecoration(
                        border: Border.all(color: MyColor.hardpink, width: 2),
                        color: MyColor.bgColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: //Image.asset(name),
                        Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset(name),
                        MyText(
                            text: 'Messsage',
                            fontsize: 18,
                            fontweight: FontWeight.w700,
                            fontcolor: MyColor.hardpink),
                      ],
                    ))
              ],
            ),
            Utils.verticalSpacer(18),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     TabBar(
            //         indicatorColor: MyColor.hardpink,
            //         indicatorWeight: 4,
            //         labelColor: MyColor.hardpink,
            //         unselectedLabelColor: MyColor.hardpink.withOpacity(.32),
            //         controller: tabController,
            //         isScrollable: true,
            //         //indicator: null,
            //         tabs: [
            //           Tab(
            //             icon: Image.asset(
            //               'assets/CategoryIconTabbar.png',
            //               height: 24,
            //               width: 24,
            //               color: MyColor.hardpink,
            //             ),
            //           ),
            //           Utils.horizontalSpacer(70),
            //           Tab(
            //             icon: Image.asset('assets/Playbutton.png',
            //                 height: 24,
            //                 width: 24,
            //                 color: MyColor.hardpink.withOpacity(.3)),
            //           ),
            //         ]),
            //   ],
            // ),
            // Utils.verticalSpacer(12),
            // Expanded(
            //   child: TabBarView(controller: tabController, children: [
            //     GridView.builder(
            //         shrinkWrap: true,
            //         padding: const EdgeInsets.all(10),
            //         gridDelegate:
            //             const SliverGridDelegateWithFixedCrossAxisCount(
            //                 crossAxisCount: 3),
            //         itemCount: 20,
            //         itemBuilder: (context, index) {
            //           return Padding(
            //             padding: const EdgeInsets.only(right: 21, bottom: 11),
            //             child: Container(
            //               width: 48,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(8),
            //                 image: const DecorationImage(
            //                     image: AssetImage('assets/ImageGirl.png'),
            //                     fit: BoxFit.cover),
            //               ),
            //               child: Padding(
            //                 padding: const EdgeInsets.only(left: 10, bottom: 4),
            //                 child: Row(
            //                   crossAxisAlignment: CrossAxisAlignment.end,
            //                   children: [
            //                     Image.asset(
            //                       'assets/Heart.png',
            //                       height: 12,
            //                       width: 11,
            //                       color: MyColor.lightpink,
            //                     ),
            //                     Utils.horizontalSpacer(10),
            //                     MyText(
            //                       text: '3.6K',
            //                       fontsize: 8,
            //                       fontcolor: MyColor.bgColor,
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           );
            //         }),
            //     GridView.builder(
            //         gridDelegate:
            //             const SliverGridDelegateWithFixedCrossAxisCount(
            //                 crossAxisCount: 3),
            //         padding: const EdgeInsets.symmetric(horizontal: 17),
            //         physics: const BouncingScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: 20,
            //         itemBuilder: (context, index) {
            //           return Container(
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(8),
            //                 image: const DecorationImage(
            //                     image: AssetImage('assets/ImageGirl.png'))),
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.end,
            //               children: [
            //                 Image.asset(
            //                   'assets/Heart.png',
            //                   height: 12,
            //                   width: 11,
            //                 ),
            //                 MyText(
            //                   text: '3.6K',
            //                   fontsize: 8,
            //                 )
            //               ],
            //             ),
            //           );
            //         })
            //   ]),
            // )
          ],
        ),
      ),
    );
  }
}
