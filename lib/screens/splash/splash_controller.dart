import 'package:chateo/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  GetStorage cacheHelper = GetStorage();

  @override
  void onInit() async {
    await navigate();
    super.onInit();
  }

  Future navigate() async {
    String? token = cacheHelper.read('token');

    bool isLoggedIn = token == null ? false : true;
    Future.delayed(
      const Duration(milliseconds: 2500),
      () => isLoggedIn
          ? Get.offNamed(
              AppRoutes.HOME,
            )
          : Get.offNamed(
              AppRoutes.ONBOARDING,
            ),
    );
  }
}
