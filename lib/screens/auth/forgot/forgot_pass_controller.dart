import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  RxBool loading = false.obs;
  GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();

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
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
      Get.toNamed(AppRoutes.LOGIN);

      showSnackBar(
        message: 'Check your email to reset your password',
        icon: const Icon(Icons.email_outlined),
      );
      update();
    } catch (e) {
      showSnackBar(
        message: e
            .toString()
            .substring(e.toString().indexOf(']') + 1, e.toString().length)
            .trim(),
        icon: const Icon(Icons.email_outlined),
      );
    } finally {
      loading(false);
      update();
    }
  }
}
