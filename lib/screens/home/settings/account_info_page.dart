import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/widgets/account_info_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    var style = Theme.of(context);
    var currentUserInfo = controller.currentUserInfo;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Info',
          style: style.textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              accountInfoItem(
                context,
                title: 'User Name',
                value: '@${currentUserInfo.userName.capitalize}',
              ),
              accountInfoItem(
                context,
                title: 'First Name',
                value: '${currentUserInfo.firstName.capitalize}',
              ),
              accountInfoItem(
                context,
                title: 'Last Name',
                value: '${currentUserInfo.lastName.capitalize}',
              ),
              if (currentUserInfo.email.length > 3)
                accountInfoItem(
                  context,
                  title: 'Email Address',
                  value: currentUserInfo.email,
                ),
              if (currentUserInfo.phone.length > 3)
                accountInfoItem(
                  context,
                  title: 'Phone Number',
                  value: currentUserInfo.phone,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
