import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/styles/colors.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;

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
      body: Padding(
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
                  'We have sent you an SMS with the code to \n+62 1309 - 1710 - 1920',
                  style: style.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40.h,
                ),
                OtpTextField(
                  numberOfFields: 5,
                  enabledBorderColor: AppColors.kGreyColor,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  textStyle:
                      const TextStyle(fontSize: 27, fontFamily: 'Mulish'),
                  focusedBorderColor: Theme.of(context).primaryColor,
                  fieldWidth: 40,
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        });
                  }, // end onSubmit
                ),
                SizedBox(
                  height: 70.sp,
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.COMPLETEPROFILE);
                  },
                  child: Text(
                    'Resend Code',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
