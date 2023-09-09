import 'package:chateo/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await navigate();
    super.onInit();
  }

  Future navigate() async {
    Future.delayed(
      const Duration(milliseconds: 2500),
      () => Get.offNamed(
        AppRoutes.ONBOARDING,
      ),
    );
  }
}
