import 'package:chateo/models/user_models.dart';
import 'package:chateo/screens/home/settings/settings_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/account_info_item.dart';

class ContactProfileInfo extends StatelessWidget {
  const ContactProfileInfo({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context);
    return Column(
      children: [
        SettingsHeaderWidget(
          currentUserInfo: userModel,
          mini: true,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      accountInfoItem(
                        context,
                        title: 'User Name',
                        mini: true,
                        value: '@${userModel.userName.toLowerCase()}',
                      ),
                      accountInfoItem(
                        context,
                        title: 'First Name',
                        mini: true,
                        value: '${userModel.firstName.capitalize}',
                      ),
                      accountInfoItem(
                        context,
                        title: 'Last Name',
                        mini: true,
                        value: '${userModel.lastName.capitalize}',
                      ),
                      if (userModel.email.length > 3)
                        accountInfoItem(
                          context,
                          title: 'Email Address',
                          mini: true,
                          value: userModel.email,
                        ),
                      if (userModel.phone.length > 3)
                        accountInfoItem(
                          context,
                          title: 'Phone Number',
                          mini: true,
                          value: userModel.phone,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
