import 'package:chateo/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  RxBool isDarkMode = Get.isDarkMode.obs;

  registerEmail() {
    Get.toNamed(AppRoutes.REGISTER);
  }

  registerPhone() {
    Get.toNamed(AppRoutes.PHONEREGISTER);
  }

  void changeAppMode() {
    if (isDarkMode.isTrue) {
      isDarkMode.value = false;
      Get.changeThemeMode(ThemeMode.light);
    } else {
      isDarkMode.value = true;

      Get.changeThemeMode(ThemeMode.dark);
    }
  }
}
