import 'dart:developer';
import 'package:chateo/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxString completeNumber = ''.obs;
  RxString verifId = ''.obs;
  RxBool loadingOtp = false.obs;
  late GlobalKey<FormState> phoneFormKey;
  late GlobalKey<FormState> completeProfileFormKey;

  late TextEditingController phoneController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    phoneController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneFormKey = GlobalKey<FormState>();
    completeProfileFormKey = GlobalKey<FormState>();

    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }

  Future<void> phoneAuth({required String phoneNumber}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        verifId.value = verificationId;
        Get.toNamed(AppRoutes.OTPVERIF);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> otpVerif({required String verificationCode}) async {
    try {
      loadingOtp(true);
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verifId.value,
        smsCode: verificationCode,
      );
      log(loadingOtp.value.toString());
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);

      if (auth.currentUser != null) {
        await Future.delayed(const Duration(seconds: 3));
        Get.toNamed(AppRoutes.COMPLETEPROFILE);
      }
      update();
    } catch (e) {
      Get.snackbar(
        'Error',
        'The verification code from SMS/TOTP is invalid. Please check and enter the correct verification code again.',
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true,
      );
    } finally {
      loadingOtp(false);
      log(loadingOtp.value.toString());
    }
  }
}
