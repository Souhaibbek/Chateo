import 'dart:developer';

import 'package:chateo/screens/auth/register/reg_controller.dart';
import 'package:chateo/styles/colors.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpVerifPage extends GetView<RegisterController> {
  const OtpVerifPage({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    // CountdownController countdownController = CountdownController();
    return Scaffold(
      //fix overflow when keyboard opens
      resizeToAvoidBottomInset: false,
      appBar: GlobalAppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetX(
        init: RegisterController(),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.fromLTRB(24.0.w, 40.0.h, 24.0.w, 16.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enter Code',
                      style: style.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'We have sent you an SMS with the code to \n${controller.completeNumber}',
                      style: style.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    OtpTextField(
                      numberOfFields: 6,
                      enabledBorderColor: AppColors.kGreyColor,
                      //set to true to show as box or false to show as dash
                      textStyle:
                          const TextStyle(fontSize: 27, fontFamily: 'Mulish'),
                      focusedBorderColor: Theme.of(context).primaryColor,
                      fieldWidth: 40.w,
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      onSubmit: (String verificationCode) async {
                        await controller.otpVerif(
                            verificationCode: verificationCode);
                      },
                    ),
                    SizedBox(
                      height: 70.sp,
                    ),
                    controller.loadingOtp.value
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.enableResend.value
                                  ? GestureDetector(
                                      onTap: () async {
                                        await controller.phoneAuth(
                                            phoneNumber: controller
                                                .completeNumber.value);
                                        controller.disableResendCode();
                                        // // countdownController.restart();
                                        // log(controller.enableResend.value
                                        //     .toString());
                                        // controller.update();
                                      },
                                      child: Text(
                                        'Resend Now',
                                        style: style.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : Countdown(
                                      seconds: 60,
                                      build:
                                          (BuildContext context, double time) =>
                                              Text(
                                        'Resend code in ${time.toInt()}',
                                        style: style.bodyMedium,
                                      ),
                                      interval:
                                          const Duration(milliseconds: 1000),
                                      onFinished: () {
                                        controller.enableResendCode();
                                        log('Timer is done!');
                                      },
                                    ),
                            ],
                          ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
