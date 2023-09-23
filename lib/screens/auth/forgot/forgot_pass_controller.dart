import 'dart:developer';
import 'package:chateo/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  RxBool loading = false.obs;

  TextEditingController emailController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  void sentResetPasswordEmail({required String emailAddress}) async {
    try {
      loading(true);
      // await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
      Get.toNamed(AppRoutes.LOGIN);

      Get.showSnackbar(
        const GetSnackBar(
          margin: EdgeInsets.all(20),
          borderRadius: 10.0,
          message: 'Check your email to reset your password',
          snackPosition: SnackPosition.BOTTOM,
          icon: Icon(Icons.email_outlined),
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      log(e.toString());
    } finally {
      loading(false);
    }
  }
}
