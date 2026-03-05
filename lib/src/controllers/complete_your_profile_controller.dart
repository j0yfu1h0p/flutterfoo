import 'package:get/get.dart';

class CompleteYourProfileController extends GetxController {
  final RxString firstName = ''.obs;
  final RxString lastName = ''.obs;
  final RxString phoneNumber = ''.obs;
  final RxString address = ''.obs;

  void onFirstNameChanged(String value) {
    firstName.value = value;
  }

  void onLastNameChanged(String value) {
    lastName.value = value;
  }

  void onPhoneChanged(String value) {
    phoneNumber.value = value;
  }

  void onAddressChanged(String value) {
    address.value = value;
  }

  void onContinuePressed() {
    if (firstName.value.trim().isEmpty ||
        lastName.value.trim().isEmpty ||
        phoneNumber.value.trim().isEmpty ||
        address.value.trim().isEmpty) {
      Get.snackbar(
        'Incomplete Form',
        'Please fill in all fields before continuing.',
      );
      return;
    }
  }
}
