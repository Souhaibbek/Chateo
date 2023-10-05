import 'dart:developer';
import 'dart:io';
import 'package:chateo/models/user_models.dart';
import 'package:chateo/routes/app_routes.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeController extends GetxController {
  late PersistentTabController tabController;
  late TextEditingController searchController;
  RxBool isDarkMode = Get.isDarkMode.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxBool loadingContactsList = false.obs;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final ImagePicker picker = ImagePicker();
  File imageFile = File('');
  RxBool isPicked = false.obs;
  @override
  void onInit() {
    tabController = PersistentTabController(initialIndex: 0);
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    searchController.dispose();
    super.onClose();
  }

  void changeAppMode() {
    if (isDarkMode.isTrue) {
      isDarkMode.value = false;
      Get.changeThemeMode(ThemeMode.light);
    } else {
      isDarkMode.value = true;
      Get.changeThemeMode(ThemeMode.dark);
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

  void logOut() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed(AppRoutes.WELCOME);
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
}
