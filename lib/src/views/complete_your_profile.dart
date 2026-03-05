import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/complete_your_profile_controller.dart';
import '../widgets/complete_your_profile.dart/form_section.dart';

class CompleteYourProfile extends StatefulWidget {
  const CompleteYourProfile({super.key});

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  final CompleteYourProfileController _controller =
      Get.find<CompleteYourProfileController>();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  void _onContinuePressed() {
    FocusScope.of(context).unfocus();
    _controller.onContinuePressed();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.075),
              const Text(
                'Complete Profile',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.02),
              const Text(
                'Complete your details',
                style: TextStyle(fontSize: 20, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.05),
              CompleteProfileFormSection(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                firstNameFocusNode: _firstNameFocusNode,
                lastNameFocusNode: _lastNameFocusNode,
                phoneFocusNode: _phoneFocusNode,
                addressFocusNode: _addressFocusNode,
                onFirstNameChanged: _controller.onFirstNameChanged,
                onLastNameChanged: _controller.onLastNameChanged,
                onPhoneChanged: _controller.onPhoneChanged,
                onAddressChanged: _controller.onAddressChanged,
                onContinue: _onContinuePressed,
              ),
              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
