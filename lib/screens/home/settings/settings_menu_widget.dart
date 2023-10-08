import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/screens/home/settings/account_info_page.dart';
import 'package:chateo/screens/home/settings/appearence_page.dart';
import 'package:chateo/screens/home/settings/privacy_security.dart';
import 'package:chateo/widgets/circular_icon_widget.dart';
import 'package:chateo/widgets/custom_bottom_sheet.dart';
import 'package:chateo/widgets/alert_dialog.dart';
import 'package:chateo/widgets/setting_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsMenuWidget extends StatelessWidget {
  const SettingsMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return SingleChildScrollView(
      child: Column(
        children: [
          settingsMenuItem(
            context,
            title: 'Account info',
            icon: Icons.supervisor_account_outlined,
            onTap: () {
              showSettingBottomSheet(context,
                  AccountInfoPage(userModel: controller.currentUserInfo));
            },
          ),
          SizedBox(
            height: 10.0.h,
          ),
          settingsMenuItem(
            context,
            title: 'Privacy & Security',
            icon: Icons.security_outlined,
            onTap: () {
              showSettingBottomSheet(context, const PrivacyAndSecurityPage());
            },
          ),
          SizedBox(
            height: 10.0.h,
          ),
          settingsMenuItem(
            context,
            title: 'Appearance',
            icon: Icons.light_mode_outlined,
            onTap: () {
              showSettingBottomSheet(
                context,
                const AppearencePage(),
              );
            },
          ),
          SizedBox(
            height: 10.0.h,
          ),
          settingsMenuItem(
            context,
            title: 'About us',
            icon: Icons.help_outline,
            onTap: () {},
          ),
          SizedBox(
            height: 10.0.h,
          ),
          settingsMenuItem(
            context,
            title: 'Log out',
            icon: Icons.logout_outlined,
            iconColor: Colors.red,
            onTap: () {
              myAlertDialog(
                context,
                onTap: () => controller.logOut(),
                text: 'Are you sure you want to exit?',
              );
            },
          ),
          SizedBox(
            height: 10.0.h,
          ),
        ],
      ),
    );
  }
}
