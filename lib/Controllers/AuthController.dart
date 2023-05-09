import 'package:get/get.dart';

class AuthController extends GetxController {
  var email = '';
  var password = '';
  var rememberMe = false;
  void toggleRememberMe(bool value) {
    // if (value == true)
    rememberMe = value;
    update();
  }
}
