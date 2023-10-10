// ignore_for_file: unused_import

import 'package:chateo/routes/app_pages.dart';
import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'styles/colors.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Assets.svgPrecacheImage();
  await GetStorage.init();
  GetStorage cacheHelper = GetStorage();
  bool isDark = cacheHelper.read('isDark') ?? false;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.kWhitePure,
  ));
  // runApp(
  //   DevicePreview(
  //     builder: (context) => const MyApp(), // Wrap your app
  //   ),
  // );
  runApp(
    MyApp(
      isDark: isDark,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return GetMaterialApp(
            // useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            getPages: AppPages.pages,
            theme: Themes.lightTheme,
            darkTheme: Themes.darkTheme,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            initialRoute: AppRoutes.SPLASH,
          );
        });
  }
}
