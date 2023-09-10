import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/screens/auth/register/register_controller.dart';
import 'package:chateo/utils/assets.dart';
import 'package:chateo/utils/buttons.dart';
import 'package:chateo/utils/text_field.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.find();
    var style = Theme.of(context);
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'Your Profile',
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 140.h,
                      width: 140.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: style.primaryColorLight,
                            child: SvgPicture.asset(
                              Assets.defaultPic,
                              colorFilter: ColorFilter.mode(
                                  style.primaryColorDark, BlendMode.srcIn),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle_sharp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    AppTextFormField(
                      controller: controller.firstNameController,
                      type: TextInputType.name,
                      hintText: 'First Name (Required)',
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    AppTextFormField(
                      controller: controller.lastNameController,
                      type: TextInputType.name,
                      hintText: 'Last Name (Optional)',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            AppButtonPrimary(
                title: 'Save',
                onPressed: () {
                  Get.toNamed(AppRoutes.HOME);
                }),
          ],
        ),
      ),
    );
  }
}
