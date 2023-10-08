import 'package:chateo/models/user_models.dart';
import 'package:chateo/widgets/account_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Info',
          style: style.textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.h),
          child: Column(
            children: [
              accountInfoItem(
                context,
                title: 'User Name',
                value: '@${userModel.userName.toLowerCase()}',
              ),
              accountInfoItem(
                context,
                title: 'First Name',
                value: '${userModel.firstName.capitalize}',
              ),
              accountInfoItem(
                context,
                title: 'Last Name',
                value: '${userModel.lastName.capitalize}',
              ),
              if (userModel.email.length > 3)
                accountInfoItem(
                  context,
                  title: 'Email Address',
                  value: userModel.email,
                ),
              if (userModel.phone.length > 3)
                accountInfoItem(
                  context,
                  title: 'Phone Number',
                  value: userModel.phone,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
