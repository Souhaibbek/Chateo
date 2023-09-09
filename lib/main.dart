import 'package:chateo/routes/app_pages.dart';
import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'screens/splash/splash_page.dart';
import 'styles/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.kWhitePure,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: ThemeMode.light,
          initialRoute: AppRoutes.SPLASH,
          home: const SplashPage(),
        );
      },
    );
  }
}
