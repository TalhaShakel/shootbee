import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../Controllers/MainControllor copy.dart';
import 'Onboarding/StartScreen.dart';
import 'Utils/AppColors.dart';
import 'Utils/Service&Function.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    changeScreen();

    super.initState();
  }

  changeScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() => const StartScreen());
    });
  }

  @override
  var ontollor = Get.put(MainControllor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/AppName.png')),
            Utils.verticalSpacer(123),
            SpinKitCircle(
              size: 70,
              color: MyColor.hexRedColor,
            )
          ],
        ),
      ),
    );
  }
}
