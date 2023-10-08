import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/screens/home/settings/change_password.dart';
import 'package:chateo/screens/home/settings/settings_menu_widget.dart';
import 'package:chateo/widgets/custom_bottom_sheet.dart';
import 'package:chateo/widgets/alert_dialog.dart';
import 'package:chateo/widgets/setting_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrivacyAndSecurityPage extends StatelessWidget {
  const PrivacyAndSecurityPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    var style = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy & Security',
          style: style.textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (controller.currentUserInfo.email.length > 3)
              settingsMenuItem(
                context,
                title: 'Change password',
                icon: Icons.private_connectivity_sharp,
                onTap: () {
                  showSettingBottomSheet(context, const ChangePasswordPage());
                },
              ),
            SizedBox(
              height: 10.0.h,
            ),
            if (controller.currentUserInfo.email.length <= 3)
              settingsMenuItem(
                context,
                title: 'Set an email to your account',
                icon: Icons.mail_outlined,
                onTap: () {},
              ),
            SizedBox(
              height: 10.0.h,
            ),
            if (controller.currentUserInfo.phone.length <= 3)
              settingsMenuItem(
                context,
                title: 'Set a phone number to your account',
                icon: Icons.phone,
                onTap: () {},
              ),
            SizedBox(
              height: 10.0.h,
            ),
            settingsMenuItem(
              context,
              iconColor: Colors.red,
              deleteMenu: true,
              title: 'Delete Account',
              icon: Icons.warning_amber_rounded,
              onTap: () {
                myAlertDialog(
                  context,
                  onTap: () async => await controller.deleteAccount(),
                  title: 'Delete account',
                  text:
                      'Are you sure you want to delete your account ? If you delete your account, you will permanently lose your profile , photo , and messages .',
                );
              },
            ),
            SizedBox(
              height: 10.0.h,
            ),
          ],
        ),
      ),
    );
  }
}
