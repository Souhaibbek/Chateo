import 'package:chateo/screens/auth/register/reg_controller.dart';
import 'package:chateo/styles/colors.dart';
import 'package:chateo/utils/assets.dart';
import 'package:chateo/utils/buttons.dart';
import 'package:chateo/utils/text_field.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> completeProfileFormKey = GlobalKey<FormState>();

    var style = Theme.of(context);
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'Complete Profile',
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
                    key: completeProfileFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 110,
                          width: 110,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: style.primaryColorLight,
                                backgroundImage: controller.isPicked.isFalse
                                    ? null
                                    : FileImage(controller.imageFile),
                                child: controller.isPicked.isFalse
                                    ? Image.asset(
                                        Assets.userPic,
                                        color: style.primaryColorDark,
                                      )
                                    : null,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(
                                      isDismissible: true,
                                      backgroundColor: style.canvasColor,
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        height: 80.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                await controller
                                                    .getFromGallery();
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.collections,
                                                    size: 30,
                                                  ),
                                                  Text(
                                                    'Gallery',
                                                    style: style
                                                        .textTheme.bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                await controller
                                                    .getFromCamera();
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.camera_alt,
                                                    size: 30,
                                                  ),
                                                  Text(
                                                    'Camera',
                                                    style: style
                                                        .textTheme.bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.add_circle_sharp,
                                    color: style.primaryColorDark,
                                    size: 30,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'First Name Is Required';
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.person),
                          controller: controller.firstNameController,
                          type: TextInputType.name,
                          hintText: 'First Name',
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        AppTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Last Name Is Required';
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.person),
                          controller: controller.lastNameController,
                          type: TextInputType.name,
                          hintText: 'Last Name',
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        if (controller.emailController.text.isNotEmpty)
                          AppTextFormField(
                            prefixIcon: const Icon(Icons.email_outlined),
                            controller: controller.emailController,
                            type: TextInputType.name,
                            enabled: false,
                            hintText: 'E-mail',
                          ),
                        SizedBox(
                          height: 12.h,
                        ),
                        if (controller.completeNumberController.text.isNotEmpty)
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
              Obx(
                () => controller.loadingSaveProfile.isTrue
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : AppButtonPrimary(
                        title: 'Start Messaging',
                        onPressed: () async {
                          if (completeProfileFormKey.currentState!.validate()) {
                            if (controller.imageFile.path != '') {
                              controller.saveProfile();
                            } else {
                              Get.showSnackbar(
                                const GetSnackBar(
                                  margin: EdgeInsets.all(20),
                                  borderRadius: 10.0,
                                  message: 'Please upload a profile image',
                                  snackPosition: SnackPosition.BOTTOM,
                                  icon: Icon(
                                    Icons.upload,
                                    color: AppColors.kGreyColor,
                                  ),
                                  duration: Duration(seconds: 1),
                                  isDismissible: true,
                                ),
                              );
                            }
                          }
                        }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
