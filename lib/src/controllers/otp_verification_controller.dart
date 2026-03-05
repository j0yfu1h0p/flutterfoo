import 'dart:async';

import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  final RxString otpCode = ''.obs;
  final RxString errorMessage = ''.obs;
  final RxInt remainingSeconds = 30.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void onOtpChanged(String code) {
    otpCode.value = code;
    if (errorMessage.value.isNotEmpty) {
      errorMessage.value = '';
    }
  }

  void onContinuePressed() {
    if (otpCode.value.length != 4) {
      errorMessage.value = 'Please enter 4-digit OTP';
      return;
    }

    if (otpCode.value == '1234') {
      errorMessage.value = '';
      Get.toNamed('/complete_your_profile');
      return;
    }

    errorMessage.value = 'Incorrect password, please try again!';
  }

  void onResendPressed() {
    errorMessage.value = '';
    otpCode.value = '';
    _startTimer(reset: true);
  }

  String get countdownText {
    final minutes = (remainingSeconds.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingSeconds.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _startTimer({bool reset = false}) {
    if (reset) {
      remainingSeconds.value = 30;
    }

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value <= 0) {
        timer.cancel();
        return;
      }
      remainingSeconds.value -= 1;
    });
  }
}
