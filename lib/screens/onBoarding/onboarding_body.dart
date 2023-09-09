import 'package:chateo/models/onboarding_model.dart';
import 'package:chateo/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'onboarding_controller.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.controller,
    required this.boarding,
  });
  final OnBoardingController controller;
  final BoardingModel boarding;
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(child: SvgPicture.asset(boarding.image)),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            color: style.primaryColorLight,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(60.w, 30.h, 60.w, 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      boarding.title,
                      style: style.textTheme.titleLarge,
                    ),
                    Text(
                      boarding.body,
                      style: style.textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: controller.boardController,
                      count: controller.boarding.length,
                      onDotClicked: (index) => controller.onDotClicked(index),
                      effect: ExpandingDotsEffect(
                        dotWidth: 10.0,
                        spacing: 3.0,
                        expansionFactor: 2,
                        activeDotColor: AppColors.kOrangeColor,
                        dotColor: style.primaryColor,
                        dotHeight: 10.0,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => controller.onButtonClick(),
                      child: !controller.isLast.value
                          ? CircleAvatar(
                              backgroundColor: style.primaryColor,
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.kWhiteColor,
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: style.primaryColor,
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  color: AppColors.kWhiteColor,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
