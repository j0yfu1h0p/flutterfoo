import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final firstNameController = TextEditingController(text: 'Jimmy');
  final lastNameController = TextEditingController(text: 'Sullivan');
  final phoneController = TextEditingController(text: '+1 898 860 864');
  final emailController = TextEditingController(text: 'jimmy@example.com');
  final passwordController = TextEditingController(text: '********');
  final addressController = TextEditingController(
    text: 'Long Beach, California',
  );
  final postalCodeController = TextEditingController(text: '90712');
  final homeNumberController = TextEditingController(text: '24');

  void saveChanges() {
    Get.snackbar(
      'Profile',
      'Changes saved successfully',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    postalCodeController.dispose();
    homeNumberController.dispose();
    super.onClose();
  }
}
