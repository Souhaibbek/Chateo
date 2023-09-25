import 'dart:developer';
import 'dart:io';
import 'package:chateo/models/user_models.dart';
import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/widgets/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/phone_number.dart';

class RegisterController extends GetxController {
  RxString completeNumber = ''.obs;
  RxString verifId = ''.obs;
  RxBool loadingOtp = false.obs;
  RxBool loadingPhoneAuth = false.obs;
  RxBool loadingEmailAuth = false.obs;
  RxBool loadingSaveProfile = false.obs;
  RxBool isInvisible = true.obs;
  RxBool enableResend = false.obs;
  IconData visiblilityIcon = Icons.visibility_rounded;
  GlobalKey<FormState> completeProfileFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController completeNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool emailIsFilled = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final ImagePicker picker = ImagePicker();
  File imageFile = File('');
  RxBool isPicked = false.obs;
  @override
  void onClose() {
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();

    emailController.dispose();
    passwordController.dispose();
    password2Controller.dispose();
    log('dispoed');
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

  Future<void> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      loadingEmailAuth(true);

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await credential.user?.sendEmailVerification();

      Get.toNamed(AppRoutes.COMPLETEPROFILE);
      update();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(
          message: 'The password provided is too weak.',
          icon: const Icon(Icons.password_sharp),
        );
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(
          message: 'The account already exists for that email.',
          icon: const Icon(Icons.email_outlined),
        );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      loadingEmailAuth(false);
      update();
    }
  }

  void getCompleteNumber(PhoneNumber phone) {
    completeNumber.value = phone.completeNumber;
    completeNumberController.text = completeNumber.value;
    update();
  }

  Future<void> phoneAuth({required String phoneNumber}) async {
    try {
      loadingPhoneAuth(true);

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
      loadingPhoneAuth(false);

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
      UserCredential userCredential =
          await auth.signInWithCredential(credential);

      if (auth.currentUser != null) {
        userCredential.additionalUserInfo!.isNewUser
            ? Get.offNamed(AppRoutes.COMPLETEPROFILE)
            : Get.offAllNamed(AppRoutes.HOME);
      }
      update();
    } catch (e) {
      showSnackBar(
        message:
            'The verification code from SMS/TOTP is invalid. Please check and enter the correct verification code again.',
        icon: const Icon(Icons.sms_failed_sharp),
      );
    } finally {
      loadingOtp(false);
    }
  }

  /// Get from gallery
  Future<void> getFromGallery() async {
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (image != null) {
      imageFile = File(image.path);
      isPicked(true);
    }
    update();
    Get.back();
  }

  /// Get from Camera
  Future<void> getFromCamera() async {
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (image != null) {
      imageFile = File(image.path);
      isPicked(true);
    }
    update();
    Get.back();
  }

  Future<void> saveProfile() async {
    try {
      loadingSaveProfile(true);
      String imgUrl = await uploadImage();

      UserModel userModel = UserModel(
        id: auth.currentUser!.uid,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        image: imgUrl,
        email: emailController.text == '' ? 'N/A' : emailController.text,
        phone:
            completeNumberController.text == '' ? 'N/A' : completeNumber.value,
      );
      await createUserProfile(userModel);
      Get.offAllNamed(AppRoutes.HOME);
      update();
    } on Exception catch (e) {
      log(e.toString());
    } finally {
      loadingSaveProfile(false);
      update();
    }
  }

  Future<void> createUserProfile(UserModel userModel) async {
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .set(userModel.toJson());
  }

  Future<String> uploadImage() async {
    String imgUrl = '';
    await storage
        .ref()
        .child('users/${Uri.file(imageFile.path).pathSegments.last}')
        .putFile(imageFile)
        .then((value) async {
      await value.ref.getDownloadURL().then((value) => imgUrl = value);
    });
    return imgUrl;
  }

  void enableResendCode() {
    enableResend(true);
    update();
  }

  void disableResendCode() {
    enableResend(false);

    update();
  }
}
