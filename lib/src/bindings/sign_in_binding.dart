import 'package:flutterfoo/src/controllers/sign_in_controller.dart';
import 'package:flutterfoo/src/services/auth_services.dart';
import 'package:get/get.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<AuthService>(() => AuthService(), fenix: true);
  }
}
