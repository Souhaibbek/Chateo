import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;
  RxBool isInvisible = true.obs;
  IconData visiblilityIcon = Icons.visibility_rounded;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void switchVisibility() {
    isInvisible(!isInvisible.value);
    if (isInvisible.isFalse) {
      visiblilityIcon = Icons.visibility_off_rounded;
      update();
    } else {
      visiblilityIcon = Icons.visibility_rounded;
      update();
    }
  }
}
