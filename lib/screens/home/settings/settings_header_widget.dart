import 'package:cached_network_image/cached_network_image.dart';
import 'package:chateo/models/user_models.dart';
import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/styles/colors.dart';
import 'package:chateo/widgets/circular_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsHeaderWidget extends StatelessWidget {
  const SettingsHeaderWidget({
    super.key,
    required this.currentUserInfo,
    this.mini = false,
  });

  final UserModel currentUserInfo;
  final bool mini;

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    var style = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: CachedNetworkImageProvider(
                currentUserInfo.image,
              ),
            ),
            Text(
              '${currentUserInfo.firstName.capitalize} ${currentUserInfo.lastName.capitalize}',
              style: style.textTheme.titleMedium!
                  .copyWith(color: AppColors.kWhitePure),
            ),
            Text('@${currentUserInfo.userName}',
                style: style.textTheme.bodySmall!.copyWith(
                  color: AppColors.kGreyColor,
                )),
            if (!mini) ...[
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularIconWidget(icon: Icons.copy, onTap: () {}),
                  SizedBox(
                    width: 20.0.w,
                  ),
                  CircularIconWidget(
                    onTap: () {
                      Get.bottomSheet(
                        isDismissible: true,
                        backgroundColor: style.canvasColor,
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 80.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await controller.getFromGallery();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.collections,
                                      size: 30,
                                    ),
                                    Text(
                                      'Gallery',
                                      style: style.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await controller.getFromCamera();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.camera_alt,
                                      size: 30,
                                    ),
                                    Text(
                                      'Camera',
                                      style: style.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: Icons.camera_alt,
                  ),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
