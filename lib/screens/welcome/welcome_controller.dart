import 'package:chateo/routes/app_routes.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  registerEmail() {
    Get.toNamed(AppRoutes.REGISTER);
  }

  registerPhone() {
    Get.toNamed(AppRoutes.PHONEREGISTER);
  }
}
