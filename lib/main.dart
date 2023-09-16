import 'package:chateo/routes/app_pages.dart';
import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/styles/themes.dart';
import 'package:chateo/utils/assets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'screens/splash/splash_page.dart';
import 'styles/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Assets.svgPrecacheImage();
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
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            themeMode: ThemeMode.system,
            initialRoute: AppRoutes.SPLASH,
          );
        });
  }
}
