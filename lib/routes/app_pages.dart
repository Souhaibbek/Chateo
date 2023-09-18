import 'package:chateo/bindings/home_binding.dart';
import 'package:chateo/bindings/onboarding_binding.dart';
import 'package:chateo/bindings/register_binding.dart';
import 'package:chateo/bindings/splash_binding.dart';
import 'package:chateo/bindings/welcome_binding.dart';
import 'package:chateo/screens/auth/forgot/forgot_pass_page.dart';
import 'package:chateo/screens/auth/login/login_page.dart';
import 'package:chateo/screens/auth/register/complete_profile_page.dart';
import 'package:chateo/screens/auth/register/phone_register.dart';
import 'package:chateo/screens/auth/register/otp_verif_page.dart';
import 'package:chateo/screens/auth/register/register_page.dart';
import 'package:chateo/screens/home/home_page.dart';
import 'package:chateo/screens/onBoarding/onboarding_page.dart';
import 'package:chateo/screens/splash/splash_page.dart';
import 'package:chateo/screens/welcome/welcome_page.dart';
import 'package:chateo/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      binding: SplashBinding(),
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      binding: OnBoardingBinding(),
      page: () => const OnBoardingPage(),
    ),
    GetPage(
      name: AppRoutes.WELCOME,
      binding: WelcomeBinding(),
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      binding: RegisterBinding(),
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.PHONEREGISTER,
      binding: RegisterBinding(),
      page: () => const PhoneRegister(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.FORGOT,
      page: () => const ForgotPassPage(),
    ),
    GetPage(
      name: AppRoutes.OTPVERIF,
      binding: RegisterBinding(),
      page: () => const OtpVerifPage(),
    ),
    GetPage(
      name: AppRoutes.COMPLETEPROFILE,
      binding: RegisterBinding(),
      page: () => const CompleteProfilePage(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      binding: HomeBinding(),
      page: () => const HomePage(),
    ),
  ];
}
