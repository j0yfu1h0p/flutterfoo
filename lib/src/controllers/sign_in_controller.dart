import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoo/src/services/auth_services.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  SignInController();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com', // TODO: Replace with your API URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  final AuthService _authService = Get.find<AuthService>();

  final RxBool isRememberMeChecked = false.obs;
  final RxString _email = ''.obs;
  final RxString _password = ''.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool isPasswordVisible = false.obs;

  String get email => _email.value;
  set email(String value) => _email.value = value;

  String get password => _password.value;
  set password(String value) => _password.value = value;

  void toggleRememberMe() {
    isRememberMeChecked.value = !isRememberMeChecked.value;
  }

  void _showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.shade100,
      colorText: Colors.green.shade900,
    );
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.shade100,
      colorText: Colors.red.shade900,
    );
  }

  void _showValidationSnackbar(String message) {
    Get.snackbar(
      'Validation Error',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orange.shade100,
      colorText: Colors.orange.shade900,
    );
  }

  Future<void> signIn() async {
    final usernameInput = email.trim();
    final passwordInput = password.trim();

    if (usernameInput.isEmpty || passwordInput.isEmpty) {
      errorMessage.value = 'Please enter email and password';
      _showValidationSnackbar(errorMessage.value);
      return;
    }

    if (usernameInput.contains('@')) {
      errorMessage.value =
          'Use username (e.g. emilys), not email, for DummyJSON login';
      _showValidationSnackbar(errorMessage.value);
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await _dio.post(
        '/auth/login',
        data: {
          'username': usernameInput,
          'password': passwordInput,
          'expiresInMins': 30,
        },
        options: Options(
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          connectTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
          extra: {
            'withCredentials': true,
          }, // equivalent of credentials: 'include'
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        // Print full response for testing
        // print('── DummyJSON Login Response ──');
        // print('id         : ${data['id']}');
        // print('username   : ${data['username']}');
        // print('email      : ${data['email']}');
        // print('firstName  : ${data['firstName']}');
        // print('lastName   : ${data['lastName']}');
        // print('accessToken: ${data['accessToken']}');
        // print('refreshToken:${data['refreshToken']}');
        // print('─────────────────────────────');

        final token = (data['accessToken'] ?? data['token'] ?? '').toString();
        if (token.isEmpty) {
          throw Exception('Login succeeded but token was missing in response');
        }
        await _authService.setToken(token);

        _showSuccessSnackbar('Welcome, ${data['firstName']}!');
        Get.offAllNamed('/home');
      }
    } on DioException catch (e) {
      if (e.response?.data is Map<String, dynamic>) {
        final responseData = e.response!.data as Map<String, dynamic>;
        errorMessage.value =
            (responseData['message'] ??
                    responseData['error'] ??
                    'Sign in failed')
                .toString();
      } else if (e.response?.data is String) {
        errorMessage.value = e.response!.data as String;
      } else {
        errorMessage.value = e.message ?? 'Network error';
      }
      _showErrorSnackbar(errorMessage.value);
    } catch (e) {
      errorMessage.value = 'An unexpected error occurred';
      _showErrorSnackbar(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
