import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar({required String message, Widget? icon}) {
  return Get.showSnackbar(
    GetSnackBar(
      margin: const EdgeInsets.all(20),
      borderRadius: 10.0,
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      icon: icon,
      duration: const Duration(seconds: 3),
      isDismissible: true,
    ),
  );
}
