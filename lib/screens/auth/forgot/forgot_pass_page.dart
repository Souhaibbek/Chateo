import 'package:chateo/screens/auth/forgot/forgot_pass_controller.dart';
import 'package:chateo/utils/buttons.dart';
import 'package:chateo/utils/text_field.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordController());
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
        init: ForgotPasswordController(),
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
                        'Forgot Password',
                        style: style.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Enter your email below to get a code to reset your password',
                        style: style.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Form(
                        key: controller.forgotFormKey,
                        child: Column(
                          children: [
                            AppTextFormField(
                              onChanged: (val) {
                                controller.update();
                              },
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
                    : AppButtonPrimary(
                        title: 'Reset Password',
                        onPressed: controller.emailController.text.isNotEmpty
                            ? () {
                                if (controller.forgotFormKey.currentState!
                                    .validate()) {
                                  controller.sentResetPasswordEmail(
                                      emailAddress: controller
                                          .emailController.text
                                          .trim());
                                }
                              }
                            : null,
                      ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
