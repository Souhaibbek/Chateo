// ignore_for_file: file_names

import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/screens/home/settings/account_info_page.dart';
import 'package:chateo/widgets/circular_icon_widget.dart';
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
    var style = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          settingsMenuItem(
            context,
            title: 'Account info',
            icon: Icons.supervisor_account_outlined,
            onTap: () {
              Get.bottomSheet(
                const AccountInfoPage(),
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
            onTap: () {},
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
            onTap: () {
              Get.defaultDialog(
                title: 'Log out',
                titleStyle: style.textTheme.titleLarge,
                middleText: 'Are you sure?',
                middleTextStyle: style.textTheme.bodyMedium,
                contentPadding: const EdgeInsets.all(25),
                actions: [
                  GestureDetector(
                    onTap: () => controller.logOut(),
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color: style.hintColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        'Yes',
                        style: style.textTheme.bodyLarge,
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color: style.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        'No',
                        style: style.textTheme.bodyLarge,
                      )),
                    ),
                  ),
                ],
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

Widget settingsMenuItem(BuildContext context,
    {required String title,
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
          iconColor: style.hintColor,
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
