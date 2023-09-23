import 'dart:developer';

import 'package:chateo/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;
  RxBool isInvisible = true.obs;
  IconData visiblilityIcon = Icons.visibility_rounded;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

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

  Future<void> signInUserPerEmail(
      {required String email, required String password}) async {
    try {
      loading(true);
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .whenComplete(() => Get.toNamed(AppRoutes.HOME));
      log(credential.user.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.showSnackbar(
          const GetSnackBar(
            margin: EdgeInsets.all(20),
            borderRadius: 10.0,
            message: 'No user found for that email.',
            snackPosition: SnackPosition.BOTTOM,
            icon: Icon(Icons.email_outlined),
            duration: Duration(seconds: 3),
            isDismissible: true,
          ),
        );
        // Get.snackbar(
        //   '',
        //   'No user found for that email.',
        //   snackPosition: SnackPosition.BOTTOM,
        //   isDismissible: true,
        // );
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.showSnackbar(
          const GetSnackBar(
            margin: EdgeInsets.all(20),
            borderRadius: 10.0,
            message: 'Wrong password provided for that user.',
            snackPosition: SnackPosition.BOTTOM,
            icon: Icon(Icons.email_outlined),
            duration: Duration(seconds: 3),
            isDismissible: true,
          ),
        );
        // Get.snackbar(
        //   '',
        //   'Wrong password provided for that user.',
        //   snackPosition: SnackPosition.BOTTOM,
        //   isDismissible: true,
        // );
        log('Wrong password provided for that user.');
      }
    } catch (e) {
      log('error is $e');
    } finally {
      loading(false);
      update();
    }
  }
}
