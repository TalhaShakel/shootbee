import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shootbee/Viwes/Splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Viwes/Onboarding/ImageScreen.dart';
import 'Viwes/Onboarding/RagisterScreen.dart';
import 'Viwes/homeScreen/VideoPostScreen.dart';
import 'Viwes/homeScreen/homeScreen.dart';
import 'Viwes/homeScreen/postScreen.dart';
import 'Viwes/homeScreen/profileScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            defaultTransition: Transition.rightToLeftWithFade,
            transitionDuration: Duration(milliseconds: 500),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            home: SplashScreen(),
          );
        });
  }
}
