import 'package:chateo/screens/onBoarding/onboarding_body.dart';
import 'package:chateo/screens/onBoarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: style.cardColor,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: style.cardColor,
        body: GetBuilder(
          init: OnBoardingController(),
          initState: (_) {},
          builder: (controller) {
            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: const ClampingScrollPhysics(),
                    controller: controller.boardController,
                    itemCount: controller.boarding.length,
                    itemBuilder: (context, index) => OnBoardingBody(
                      controller: controller,
                      boarding: controller.boarding[index],
                    ),
                    onPageChanged: (index) {
                      controller.changeState(index);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
