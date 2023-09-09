import 'package:chateo/screens/welcome/welcome_controller.dart';
import 'package:chateo/styles/colors.dart';
import 'package:chateo/utils/assets.dart';
import 'package:chateo/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: WelcomeController(),
      initState: (_) {},
      builder: (controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: controller.isDarkMode.isFalse
                ? Brightness.dark
                : Brightness.light,
            statusBarColor: controller.isDarkMode.isFalse
                ? AppColors.kWhitePure
                : AppColors.kBlackColor,
            statusBarBrightness: controller.isDarkMode.isFalse
                ? Brightness.dark
                : Brightness.light,
          ),
          child: Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60.w),
                          child: SvgPicture.asset(
                            Assets.background,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.changeAppMode();
                          },
                          child: const Icon(
                            Icons.dark_mode_sharp,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 47.w),
                          child: Text(
                            'Connect easily with your family and friends over countries',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Terms & Privacy Policy',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                          child: AppButtonPrimary(
                            title: 'Start Messaging',
                            onPressed: () => controller.navigateToNextPage(),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
