import 'package:cached_network_image/cached_network_image.dart';
import 'package:chateo/models/user_models.dart';
import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:day_night_themed_switch/day_night_themed_switch.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    UserModel currentUserInfo = controller.currentUserInfo;

    var style = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.33,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.fromLTRB(
                20.0,
                8.0,
                0.0,
                12.0,
              ),
              title: Text(
                '${currentUserInfo.firstName} ${currentUserInfo.lastName}'
                    .capitalize!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: style.textTheme.titleLarge!,
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    placeholder: (context, url) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: style.primaryColor,
                        ),
                      );
                    },
                    imageUrl: currentUserInfo.image,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 20.h,
                    right: 10.w,
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        color: AppColors.kOrangeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 1000.h,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20.0,
                      20.0,
                      10.0,
                      20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account info',
                          style: style.textTheme.titleMedium!
                              .copyWith(color: style.primaryColor),
                        ),
                        settingsMenuItem(
                          context,
                          title: 'First name',
                          value: currentUserInfo.firstName.capitalize!,
                        ),
                        settingsMenuItem(
                          context,
                          title: 'Last name',
                          value: currentUserInfo.lastName.capitalize!,
                        ),
                        if (currentUserInfo.email != 'N/A') ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Container(
                              height: 1.0,
                              color: AppColors.kGreyColor.withOpacity(0.6),
                            ),
                          ),
                          settingsMenuItem(
                            context,
                            title: 'E-mail',
                            value: currentUserInfo.email,
                          ),
                        ],
                        if (currentUserInfo.phone != 'N/A') ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Container(
                              height: 1.0,
                              color: AppColors.kGreyColor.withOpacity(0.6),
                            ),
                          ),
                          settingsMenuItem(
                            context,
                            title: 'Phone number',
                            value: currentUserInfo.phone,
                          ),
                        ],
                        Text(
                          'Settings',
                          style: style.textTheme.titleMedium!
                              .copyWith(color: style.primaryColor),
                        ),
                        if (currentUserInfo.phone == 'N/A') ...[
                          const SizedBox(height: 10.0),
                          GestureDetector(
                            child: Text(
                              'Link your account with a phone number?',
                              style: style.textTheme.titleSmall!
                                  .copyWith(color: style.primaryColor),
                            ),
                          ),
                        ],
                        if (currentUserInfo.email == 'N/A') ...[
                          const SizedBox(height: 10.0),
                          GestureDetector(
                            child: Text(
                              'Link your account with an E-mail?',
                              style: style.textTheme.titleSmall!
                                  .copyWith(color: style.primaryColor),
                            ),
                          ),
                        ],
                        if (currentUserInfo.email != 'N/A') ...[
                          const SizedBox(height: 10.0),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Change password?',
                              style: style.textTheme.titleSmall!
                                  .copyWith(color: style.primaryColor),
                            ),
                          ),
                        ],
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Theme mode',
                              style: style.textTheme.titleSmall!
                                  .copyWith(color: style.primaryColor),
                            ),
                            Obx(
                              () => SizedBox(
                                height: 20,
                                child: DayNightSwitch(
                                    value: controller.isDarkMode.value,
                                    onChanged: (_) {
                                      controller.changeAppMode();
                                    }),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () async {
                            var auth = FirebaseAuth.instance;
                            await auth.signOut().then(
                                (value) => Get.offAllNamed(AppRoutes.WELCOME));
                          },
                          child: Text(
                            'Log out',
                            style: style.textTheme.titleSmall!
                                .copyWith(color: style.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox settingsMenuItem(BuildContext context,
      {required String title, required String value, Function()? onTap}) {
    var style = Theme.of(context);

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: style.textTheme.bodyMedium,
                ),
                Text(
                  value,
                  style: style.textTheme.bodyMedium!.copyWith(fontSize: 18),
                ),
              ],
            ),
            InkWell(
              onTap: onTap,
              child: const Icon(Icons.edit_note_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
