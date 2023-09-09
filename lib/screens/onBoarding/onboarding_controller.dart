import 'package:chateo/models/onboarding_model.dart';
import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  late final PageController boardController;
  RxBool isLast = false.obs;
  @override
  void onInit() {
    boardController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    boardController.dispose();
    super.onClose();
  }

  void changeState(int index) {
    if (index == boarding.length - 1) {
      isLast.value = true;
    } else {
      isLast.value = false;
    }
  }

  void onDotClicked(int index) {
    boardController.jumpToPage(index);
    if (index == 3) {
      isLast.value = true;
    } else {
      isLast.value = false;
    }
  }

  void onButtonClick() {
    if (isLast.isTrue) {
      Get.toNamed(AppRoutes.WELCOME);
    } else {
      if (boardController.page == 3) {
        isLast.value = true;
      } else {
        isLast.value = false;
        boardController.jumpToPage(boardController.page!.toInt() + 1);
      }
    }
  }

  List<BoardingModel> boarding = [
    BoardingModel(
      image: Assets.onboarding1,
      title: 'Simple & Easy to Use',
      body: 'As simple as it could be! Equiped with smart features.',
    ),
    BoardingModel(
      image: Assets.onboarding2,
      title: 'Smart Features',
      body: 'Smart features like Groups are the main focus.',
    ),
    BoardingModel(
      image: Assets.onboarding3,
      title: 'Safe & Secure',
      body:
          'Yes! you hared right. We are safe and secure. Your chats are not end-to-end encrypted.',
    ),
    BoardingModel(
      image: Assets.onboarding4,
      title: 'Dark Theme',
      body:
          'Dark in the lite & lite in the Dark!! Dark theme included to protect your vision.',
    ),
  ];
}
