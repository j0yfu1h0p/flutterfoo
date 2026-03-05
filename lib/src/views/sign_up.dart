import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/sign_up_controller.dart';
import '../widgets/sign_up/sign_up_form_section.dart';
import '../widgets/sign_up/sign_up_header_section.dart';
import '../widgets/sign_up/sign_up_login_prompt.dart';
import '../widgets/sign_up/sign_up_social_section.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignUpController _signUpController = Get.find<SignUpController>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _openSocialLink(String link) async {
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _onCreateAccountPressed() {
    _signUpController.onCreateAccountPressed();

    if (!_signUpController.isPasswordValid) {
      return;
    }
    Get.toNamed('/otp_verification');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          child: Builder(
            builder: (context) {
              final size = MediaQuery.of(context).size;
              final screenHeight = size.height;
              final screenWidth = size.width;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignUpHeaderSection(screenHeight: screenHeight),
                  SignUpFormSection(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    signUpController: _signUpController,
                    emailFocusNode: _emailFocusNode,
                    passwordFocusNode: _passwordFocusNode,
                    confirmPasswordFocusNode: _confirmPasswordFocusNode,
                    onCreateAccount: _onCreateAccountPressed,
                  ),

                  SizedBox(height: screenHeight * 0.025),
                  SignUpSocialSection(
                    screenWidth: screenWidth,
                    onOpenSocialLink: _openSocialLink,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SignUpLoginPrompt(
                    screenWidth: screenWidth,
                    onLoginPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
