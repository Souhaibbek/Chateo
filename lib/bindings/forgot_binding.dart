import 'package:chateo/screens/auth/forgot/forgot_pass_controller.dart';
import 'package:get/get.dart';

class ForgotBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}
