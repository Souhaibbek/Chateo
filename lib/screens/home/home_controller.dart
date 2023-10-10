import 'dart:developer';
import 'dart:io';
import 'package:chateo/models/user_models.dart';
import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/screens/home/settings/settings.view.dart';
import 'package:chateo/widgets/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeController extends GetxController {
  RxBool isDarkMode = Get.isDarkMode.obs;
  RxBool isInvisible = true.obs;
  IconData visiblilityIcon = Icons.visibility_rounded;

  RxBool loadingContactsList = false.obs;
  RxBool loadingChangePassword = false.obs;
  late PersistentTabController tabController;
  late TextEditingController searchController;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  File imageFile = File('');
  RxBool isPicked = false.obs;
  final ImagePicker picker = ImagePicker();
  final GetStorage cacheHelper = GetStorage();
  @override
  void onInit() async {
    tabController = PersistentTabController(initialIndex: 0);
    searchController = TextEditingController();
    await getContactsList();

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    searchController.dispose();
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

  void changeAppMode() async {
    if (isDarkMode.isTrue) {
      isDarkMode.value = false;

      Get.changeThemeMode(ThemeMode.light);
      await cacheHelper.write('isDark', false);
    } else {
      isDarkMode.value = true;
      Get.changeThemeMode(ThemeMode.dark);

      await cacheHelper.write('isDark', true);
    }
  }

  List<UserModel> contacts = [];

  late UserModel currentUserInfo;
  Future<void> getContactsList() async {
    try {
      loadingContactsList(true);
      if (contacts.isEmpty) {
        await firestore.collection('users').get().then((value) {
          for (var element in value.docs) {
            if (element.id == auth.currentUser!.uid) {
              currentUserInfo = UserModel.fromJson(element.data());
            } else {
              contacts.add(UserModel.fromJson(element.data()));
            }
          }
        });
        update();
        log('getContactsList');
      }
    } on Exception catch (e) {
      log(e.toString());
    } finally {
      loadingContactsList(false);
      update();
    }
  }

  void logOut() async {
    final user = FirebaseAuth.instance;
    user.signOut();
    Get.offAllNamed(AppRoutes.WELCOME);
    await cacheHelper.remove('token');
  }

  Future<void> deleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    await user!.delete();
    Get.offAllNamed(AppRoutes.WELCOME);
    showSnackBar(
      message: 'Account has been deleted successfully',
      icon: const Icon(Icons.password_sharp),
    );
    await cacheHelper.remove('token');
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

  //upload image
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

  //change password
  Future<void> changePassword(
      {required String currentPassword, required String newPassword}) async {
    var user = FirebaseAuth.instance.currentUser!;
    loadingChangePassword(true);
    try {
      bool isLoggedIn = await reauthenticateUser(currentPassword);
      if (isLoggedIn) {
        await user.updatePassword(newPassword).then((value) {
          Get.to(const SettingsView());
          showSnackBar(
            message: 'Password has been changed successfully',
            icon: const Icon(Icons.password_sharp),
          );
        });
      }
    } on Exception catch (e) {
      showSnackBar(
        message: e.toString(),
        icon: const Icon(Icons.password_sharp),
      );
    } finally {
      loadingChangePassword(false);
    }
  }

  Future<bool> reauthenticateUser(String password) async {
    bool success = false;

    //Create an instance of the current user.
    var user = FirebaseAuth.instance.currentUser!;
    //Must re-authenticate user before updating the password. Otherwise it may fail or user get signed out.
    final cred =
        EmailAuthProvider.credential(email: user.email!, password: password);

    try {
      await user
          .reauthenticateWithCredential(cred)
          .then((value) => success = true);
      return success;
    } on FirebaseException catch (e) {
      if (e.code == 'wrong-password') {
        showSnackBar(
          message: 'Current password is incorrect, Please try again!',
          icon: const Icon(Icons.password_sharp),
        );
      }
      if (e.code == 'too-many-requests') {
        showSnackBar(
            message: 'Too many requests, Please try again later!',
            icon: const Icon(Icons.data_array));
      }
      return success;
    }
  }
}
