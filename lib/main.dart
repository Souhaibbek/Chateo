import 'package:chateo/routes/app_pages.dart';
import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'screens/splash/splash_page.dart';
import 'styles/colors.dart';

void main() async {
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
        //add this line
        // ScreenUtil.registerToBuild(context);
        return MediaQuery(
          //Setting font does not change with system font size
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: AppPages.pages,
            theme: Themes.lightTheme,
            darkTheme: Themes.darkTheme,
            themeMode: ThemeMode.light,
            initialRoute: AppRoutes.SPLASH,
            home: const SplashPage(),
          ),
        );
      },
    );
  }
}
