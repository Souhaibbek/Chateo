import 'dart:developer';
import 'package:chateo/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';

class RegisterController extends GetxController {
  RxString completeNumber = ''.obs;
  RxString verifId = ''.obs;
  RxBool loadingOtp = false.obs;
  RxBool loading = false.obs;
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> completeProfileFormKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController completeNumberController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onClose() {
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }

  void getCompleteNumber(PhoneNumber phone) {
    completeNumber.value = phone.completeNumber;
    completeNumberController.text = completeNumber.value;
    update();
  }

  Future<void> phoneAuth({required String phoneNumber}) async {
    try {
      loading(true);
      update();

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
    } finally {
      loading(false);
      update();
    }
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
