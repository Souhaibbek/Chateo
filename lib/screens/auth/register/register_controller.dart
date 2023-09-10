import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController phoneController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;

  @override
  void onInit() {
    phoneController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }
}
