import 'package:get/get.dart';

class SignUpController extends GetxController {
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxString confirmPassword = ''.obs;
  final RxBool showPasswordValidation = false.obs;
  final RxBool isPasswordObscured = true.obs;
  final RxBool isConfirmPasswordObscured = true.obs;
  final RxString emailValidationError = ''.obs;
  final RxString passwordValidationError = ''.obs;

  SignUpController();

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscured.value = !isConfirmPasswordObscured.value;
  }

  void onEmailChanged(String value) {
    email.value = value;
    if (showPasswordValidation.value) {
      _updatePasswordValidationErrors();
    }
  }

  void onPasswordChanged(String value) {
    password.value = value;
    showPasswordValidation.value = true;
    _updatePasswordValidationErrors();
  }

  void onConfirmPasswordChanged(String value) {
    confirmPassword.value = value;
    showPasswordValidation.value = true;
    _updatePasswordValidationErrors();
  }

  void onCreateAccountPressed() {
    showPasswordValidation.value = true;
    _updatePasswordValidationErrors();
  }

  bool get isPasswordValid =>
      emailValidationError.value.isEmpty &&
      passwordValidationError.value.isEmpty;

  void _updatePasswordValidationErrors() {
    final currentPassword = password.value;
    final currentEmail = email.value.trim();

    if (currentEmail.isEmpty) {
      emailValidationError.value = 'Please enter your email';
    } else {
      final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
      if (!emailRegex.hasMatch(currentEmail)) {
        emailValidationError.value = 'Please enter a valid email';
      } else {
        emailValidationError.value = '';
      }
    }

    if (currentPassword.isEmpty) {
      passwordValidationError.value = 'Please enter your password';
      return;
    }

    if (currentPassword.length < 8) {
      passwordValidationError.value = 'Password must be at least 8 characters';
      return;
    }

    final hasNumber = RegExp(r'\d').hasMatch(currentPassword);
    final hasSymbol = RegExp(r'[^A-Za-z0-9]').hasMatch(currentPassword);
    if (!hasNumber && !hasSymbol) {
      passwordValidationError.value =
          'Password must include a number or symbol';
      return;
    }

    if (confirmPassword.value.isNotEmpty &&
        currentPassword != confirmPassword.value) {
      passwordValidationError.value = 'Passwords do not match';
      return;
    }

    passwordValidationError.value = '';
  }
}
