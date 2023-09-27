import 'dart:developer';

import 'package:chateo/models/user_models.dart';
import 'package:chateo/screens/home/chats_view.dart';
import 'package:chateo/screens/home/contacts_view.dart';
import 'package:chateo/screens/home/settings.view.dart';
import 'package:chateo/styles/colors.dart';
import 'package:chateo/utils/assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeController extends GetxController {
  late PersistentTabController tabController;
  late TextEditingController searchController;
  RxBool isDarkMode = Get.isDarkMode.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxBool loadingContactsList = false.obs;

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

  List<Widget> buildScreens() {
    return [
      const ContactsView(),
      const ChatsView(),
      const SettingsView(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        title: "Contacts",
        textStyle: TextStyle(
          fontFamily: 'Mulish',
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: 0,
        iconSize: 18,
        inactiveIcon: SvgPicture.asset(
          Assets.contactIcon,
          colorFilter: ColorFilter.mode(
              Get.isDarkMode ? AppColors.kWhiteColor : AppColors.kBlackColor,
              BlendMode.srcIn),
        ),
        activeColorPrimary:
            Get.isDarkMode ? AppColors.kWhitePure : AppColors.kBlackColor,
        inactiveColorPrimary:
            Get.isDarkMode ? AppColors.kWhiteColor : AppColors.kBlackColor,
        icon: Container(),
      ),
      PersistentBottomNavBarItem(
        title: "Chats",
        textStyle: TextStyle(
          fontFamily: 'Mulish',
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: 0,
        iconSize: 18,
        inactiveIcon: SvgPicture.asset(
          Assets.chatIcon,
          colorFilter: ColorFilter.mode(
              Get.isDarkMode ? AppColors.kWhiteColor : AppColors.kBlackColor,
              BlendMode.srcIn),
        ),
        activeColorPrimary:
            Get.isDarkMode ? AppColors.kWhitePure : AppColors.kBlackColor,
        inactiveColorPrimary:
            Get.isDarkMode ? AppColors.kWhiteColor : AppColors.kBlackColor,
        icon: Container(),
      ),
      PersistentBottomNavBarItem(
        title: "Settings",
        textStyle: TextStyle(
          fontFamily: 'Mulish',
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: 0,
        iconSize: 18,
        inactiveIcon: SvgPicture.asset(
          Assets.moreIcon,
          colorFilter: ColorFilter.mode(
              Get.isDarkMode ? AppColors.kWhiteColor : AppColors.kBlackColor,
              BlendMode.srcIn),
        ),
        activeColorPrimary:
            Get.isDarkMode ? AppColors.kWhitePure : AppColors.kBlackColor,
        inactiveColorPrimary:
            Get.isDarkMode ? AppColors.kWhiteColor : AppColors.kBlackColor,
        icon: Container(),
      ),
    ];
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
}
