import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkTokenAndNavigate();
  }

  Future<void> _checkTokenAndNavigate() async {
    // Add a small delay for better UX (2 seconds)
    await Future.delayed(const Duration(seconds: 2));

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token != null && token.isNotEmpty) {
        // Token exists, go to home screen
        Get.offNamed('/home');
      } else {
        // No token, go to welcome/login screen
        Get.offNamed('/welcome');
      }
    } catch (e) {
      // If error occurs, go to welcome screen as fallback
      Get.offNamed('/welcome');
    }
  }
}
