import 'dart:developer';

import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/utils/buttons.dart';
import 'package:chateo/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController currentPassController = TextEditingController();
    TextEditingController newPassController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var style = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Change password',
            style: style.textTheme.headlineMedium,
          ),
        ),
        body: GetBuilder(
          builder: (HomeController controller) {
            return Padding(
              padding: EdgeInsets.all(20.0.h),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppTextFormField(
                              onChanged: (val) {
                                controller.update();
                              },
                              validator: (value) {
                                if (value == null || value == '') {
                                  return 'Please enter your current password';
                                } else {
                                  if (value.length < 8) {
                                    return 'Password too short';
                                  }
                                }
                                return null;
                              },
                              controller: currentPassController,
                              hintText: 'Current password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.switchVisibility();
                                },
                                icon: Icon(controller.visiblilityIcon),
                              ),
                              pass: controller.isInvisible.value,
                              prefixIcon:
                                  const Icon(Icons.lock_outline_rounded),
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            AppTextFormField(
                              onChanged: (val) {
                                controller.update();
                              },
                              validator: (value) {
                                if (value == null || value == '') {
                                  return 'Please enter your new password';
                                } else {
                                  if (value.length < 8) {
                                    return 'Password too short';
                                  }
                                }
                                return null;
                              },
                              controller: newPassController,
                              hintText: 'New password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.switchVisibility();
                                },
                                icon: Icon(controller.visiblilityIcon),
                              ),
                              pass: controller.isInvisible.value,
                              prefixIcon:
                                  const Icon(Icons.lock_outline_rounded),
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            AppTextFormField(
                              onChanged: (val) {
                                controller.update();
                              },
                              validator: (value) {
                                if (value == null || value == '') {
                                  return 'Please re-type your new password';
                                } else {
                                  if (value != newPassController.text) {
                                    return 'Password should be identical';
                                  }
                                }
                                return null;
                              },
                              controller: confirmPassController,
                              hintText: 'Confirm password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.switchVisibility();
                                },
                                icon: Icon(controller.visiblilityIcon),
                              ),
                              pass: controller.isInvisible.value,
                              prefixIcon:
                                  const Icon(Icons.lock_outline_rounded),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Obx(
                              () => controller.loadingChangePassword.isTrue
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: style.primaryColor,
                                      ),
                                    )
                                  : AppButtonPrimary(
                                      title: 'Change Password',
                                      onPressed: currentPassController
                                                  .text.isNotEmpty &&
                                              newPassController
                                                  .text.isNotEmpty &&
                                              confirmPassController
                                                  .text.isNotEmpty
                                          ? () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                controller.changePassword(
                                                    currentPassword:
                                                        currentPassController
                                                            .text,
                                                    newPassword:
                                                        newPassController.text);
                                              }
                                            }
                                          : null),
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
