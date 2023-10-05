import 'package:chateo/models/user_models.dart';
import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/screens/home/settings/settings_menu.dart';
import 'package:chateo/screens/home/settings/settings_header_widget.dart';
import 'package:chateo/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    UserModel currentUserInfo = controller.currentUserInfo;

    var style = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.kBackBlack,
      extendBody: true,
      appBar: AppBar(
          toolbarHeight: 10,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light)),
      body: Column(
        children: [
          SettingsHeaderWidget(
            currentUserInfo: currentUserInfo,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: style.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.elliptical(70, 30),
                  topRight: Radius.elliptical(70, 30),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: SettingsMenuWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
