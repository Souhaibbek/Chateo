import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/screens/auth/login/login_controller.dart';
import 'package:chateo/utils/buttons.dart';
import 'package:chateo/utils/text_field.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    var style = Theme.of(context);

    return Scaffold(
      appBar: GlobalAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder(
        init: LoginController(),
        initState: (_) {},
        builder: (controller) => Padding(
          padding: EdgeInsets.fromLTRB(24.0.w, 0.0.h, 24.0.w, 16.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Log in to Chateo',
                        style: style.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Welcome back! Sign in using your email to continue us',
                        style: style.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Form(
                        key: controller.loginFormKey,
                        child: Column(
                          children: [
                            AppTextFormField(
                              onChanged: (val) {
                                controller.update();
                              },
                              type: TextInputType.emailAddress,
                              validator: (value) {
                                if (!EmailValidator.validate(value ?? '')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              controller: controller.emailController,
                              hintText: 'E-mail',
                              prefixIcon: const Icon(Icons.email_outlined),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            AppTextFormField(
                              onChanged: (val) {
                                controller.update();
                              },
                              validator: (value) {
                                if (value == null || value == '') {
                                  return 'Please enter your password';
                                } else {
                                  if (value.length < 8) {
                                    return 'Password too short';
                                  }
                                }
                                return null;
                              },
                              controller: controller.passwordController,
                              hintText: 'Password',
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
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.offAndToNamed(AppRoutes.FORGOT);
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    textAlign: TextAlign.right,
                                    style: style.textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Obx(
                () => controller.loading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : Column(
                        children: [
                          AppButtonPrimary(
                            title: 'Log in',
                            onPressed: controller
                                        .emailController.text.isNotEmpty &&
                                    controller
                                        .passwordController.text.isNotEmpty
                                ? () {
                                    if (controller.loginFormKey.currentState!
                                        .validate()) {
                                      controller.signInUserPerEmail(
                                          email:
                                              controller.emailController.text,
                                          password: controller
                                              .passwordController.text);
                                    }
                                  }
                                : null,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Not Registered Yet? ',
                                style: style.textTheme.bodyMedium!,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.offAndToNamed(AppRoutes.REGISTER);
                                },
                                child: Text(
                                  'Sign up',
                                  style: style.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
