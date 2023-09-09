import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController phoneController;
  @override
  void onInit() {
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
