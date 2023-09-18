import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/screens/welcome/welcome_controller.dart';
import 'package:chateo/styles/colors.dart';
import 'package:chateo/utils/assets.dart';
import 'package:chateo/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context);

    return GetBuilder(
      init: WelcomeController(),
      initState: (_) {},
      builder: (controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: AppColors.kBlackPure,
            body: Stack(
              children: [
                Image.asset(Assets.gradient),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.changeAppMode();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.logo,
                                width: 20,
                              ),
                              Text(
                                ' Chateo',
                                textAlign: TextAlign.center,
                                style: style.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.kWhitePure,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Connect\n',
                                      style: style.textTheme.displayLarge!
                                          .copyWith(
                                        color: AppColors.kWhitePure,
                                        fontSize: 60.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'friends\n',
                                      style: style.textTheme.displayLarge!
                                          .copyWith(
                                        color: AppColors.kWhitePure,
                                        fontSize: 60.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'easily &\n',
                                      style: style.textTheme.displayLarge!
                                          .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.kWhitePure,
                                        fontSize: 60.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'quickly',
                                      style: style.textTheme.displayLarge!
                                          .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.kWhitePure,
                                        fontSize: 60.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.75),
                              child: Text(
                                'Our chat app is the perfect way to stay connected with friends and family.',
                                textAlign: TextAlign.left,
                                style: style.textTheme.bodyMedium!
                                    .copyWith(color: AppColors.kGreyColor),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Container(
                                width: 48.w,
                                height: 48.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(48),
                                  border: Border.all(
                                    color: AppColors.kWhitePure,
                                  ),
                                ),
                                child: Center(
                                  child: IconButton(
                                      onPressed: () =>
                                          controller.registerPhone(),
                                      icon: const Icon(
                                        Icons.phone,
                                        color: AppColors.kWhitePure,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 30.0.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Divider(
                                          color:
                                              style.hintColor.withOpacity(0.5),
                                          thickness: 1),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        'OR',
                                        textAlign: TextAlign.center,
                                        style: style.textTheme.bodyMedium!
                                            .copyWith(
                                                color: AppColors.kGreyColor),
                                      ),
                                    ),
                                    Flexible(
                                      child: Divider(
                                          color:
                                              style.hintColor.withOpacity(0.5),
                                          thickness: 1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                          child: AppButtonPrimary(
                            title: 'Sign up with E-mail',
                            titleColor: AppColors.kBlackColor,
                            color: AppColors.kWhitePure,
                            onPressed: () => controller.registerEmail(),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Existing account? ',
                              style: style.textTheme.bodyMedium!.copyWith(
                                color: AppColors.kWhitePure,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.LOGIN);
                              },
                              child: Text(
                                'Log in',
                                style: style.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.kWhitePure,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
