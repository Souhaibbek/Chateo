import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/screens/auth/login/login_page.dart';
import 'package:chateo/screens/auth/register/complete_profile_page.dart';
import 'package:chateo/screens/auth/register/register_page.dart';
import 'package:chateo/screens/auth/register/verification_page.dart';
import 'package:chateo/screens/home/home_page.dart';
import 'package:chateo/screens/onBoarding/onboarding_page.dart';
import 'package:chateo/screens/splash/splash_page.dart';
import 'package:chateo/screens/welcome/welcome_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnBoardingPage(),
    ),
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.VERIFICATION,
      page: () => const VerificationPage(),
    ),
    GetPage(
      name: AppRoutes.COMPLETEPROFILE,
      page: () => const CompleteProfilePage(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
    ),
  ];
}
