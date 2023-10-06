import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/screens/home/settings/account_info_page.dart';
import 'package:chateo/screens/home/settings/appearence_page.dart';
import 'package:chateo/widgets/circular_icon_widget.dart';
import 'package:chateo/widgets/logout_dialog.dart';
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
              showBottomSheet(
                elevation: 20,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                builder: (context) => AccountInfoPage(
                  userModel: controller.currentUserInfo,
                ),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.55,
                ),
              );
            },
          ),
          SizedBox(
            height: 10.0.h,
          ),
          settingsMenuItem(
            context,
            title: 'Privacy & Security',
            icon: Icons.security_outlined,
            onTap: () {},
          ),
          SizedBox(
            height: 10.0.h,
          ),
          settingsMenuItem(
            context,
            title: 'Appearance',
            icon: Icons.light_mode_outlined,
            onTap: () {
              showBottomSheet(
                elevation: 20,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                builder: (context) => const AppearencePage(),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.55,
                ),
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
              logOutAlertDialog(controller, context);
            },
          ),
          SizedBox(
            height: 10.0.h,
          ),
        ],
      ),
    );
  }

  void settingsMenuItemBottomSheet(Widget widget) {
    Get.bottomSheet(
      widget,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  Widget settingsMenuItem(BuildContext context,
      {required String title,
      Color? iconColor,
      required void Function() onTap,
      required IconData icon}) {
    var style = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircularIconWidget(
            icon: icon,
            onTap: () {},
            color: style.primaryColorLight,
            iconColor: iconColor ?? style.hintColor,
          ),
          SizedBox(
            width: 10.0.w,
          ),
          Text(
            title,
            style: style.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
