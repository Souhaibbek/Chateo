import 'dart:developer';

import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;
  RxBool isInvisible = true.obs;
  IconData visiblilityIcon = Icons.visibility_rounded;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GetStorage cacheHelper = GetStorage();
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
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(AppRoutes.HOME);
      await cacheHelper.write('token', credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(
          message: 'No user found for that email.',
          icon: const Icon(Icons.email_outlined),
        );
      } else if (e.code == 'wrong-password') {
        showSnackBar(
          message: 'Wrong password provided for that user.',
          icon: const Icon(Icons.password_sharp),
        );
      }
    } catch (e) {
      log('error is $e');
    } finally {
      loading(false);
      update();
    }
  }
}
