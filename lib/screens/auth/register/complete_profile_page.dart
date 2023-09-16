import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/screens/auth/register/register_controller.dart';
import 'package:chateo/utils/assets.dart';
import 'package:chateo/utils/buttons.dart';
import 'package:chateo/utils/text_field.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: GetBuilder(
        init: RegisterController(),
        initState: (_) {},
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.completeProfileFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: style.primaryColorLight,
                                child: Image.asset(
                                  Assets.userPic,
                                  color: style.primaryColorDark,
                                ),
                              ),
                              const Positioned(
                                bottom: 5,
                                right: 5,
                                child: Icon(
                                  Icons.add_circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        AppTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'First Name Is Required';
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.person),
                          controller: controller.firstNameController,
                          type: TextInputType.name,
                          hintText: 'First Name (Required)',
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        AppTextFormField(
                          prefixIcon: const Icon(Icons.person),
                          controller: controller.lastNameController,
                          type: TextInputType.name,
                          hintText: 'Last Name (Optional)',
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        AppTextFormField(
                          prefixIcon: const Icon(Icons.phone_android_sharp),
                          controller: controller.completeNumberController,
                          type: TextInputType.name,
                          enabled: false,
                          hintText: 'Phone Number',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              AppButtonPrimary(
                  title: 'Save',
                  onPressed: () {
                    if (controller.completeProfileFormKey.currentState!
                        .validate()) {
                      Get.toNamed(AppRoutes.HOME);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
