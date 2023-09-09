import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/screens/auth/register/register_controller.dart';

import 'package:chateo/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/text_field.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    var style = Theme.of(context);
    return GetBuilder(
      init: RegisterController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(24.0.w, 40.0.h, 24.0.w, 16.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Enter Your Phone Number',
                          style: style.textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Please confirm your country code and enter your phone number',
                          style: style.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        AppTextFormField(
                          controller: controller.phoneController,
                          type: TextInputType.phone,
                          hintText: 'Phone Number',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                AppButtonPrimary(
                    title: 'Continue',
                    onPressed: () {
                      Get.toNamed(AppRoutes.VERIFICATION);
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
