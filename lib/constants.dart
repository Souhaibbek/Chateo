import 'package:chateo/screens/home/chats_view.dart';
import 'package:chateo/screens/home/settings/settings.view.dart';
import 'package:chateo/styles/colors.dart';
import 'package:chateo/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'screens/home/contacts/contacts_view.dart';

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
        fontSize: 18.sp,
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
      icon: Center(
        child: Text(
          "Contacts",
          style: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    PersistentBottomNavBarItem(
      title: "Chats",
      textStyle: TextStyle(
        fontFamily: 'Mulish',
        fontSize: 18.sp,
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
      icon: Center(
        child: Text(
          "Chats",
          style: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    PersistentBottomNavBarItem(
      title: "Settings",
      textStyle: TextStyle(
        fontFamily: 'Mulish',
        fontSize: 18.sp,
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
      icon: Center(
        child: Text(
          "Settings",
          style: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ];
}
