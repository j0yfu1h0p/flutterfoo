import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sign_up_controller.dart';
import 'sign_up_input_field.dart';
import 'validation_error_item.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.signUpController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.confirmPasswordFocusNode,
    required this.onCreateAccount,
  });

  final double screenWidth;
  final double screenHeight;
  final SignUpController signUpController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode confirmPasswordFocusNode;
  final VoidCallback onCreateAccount;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: SignUpInputField(
              label: 'Email',
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: signUpController.onEmailChanged,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
              suffixIcon: Icon(Icons.email_outlined, color: Colors.grey[400]),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Obx(
              () => SignUpInputField(
                label: 'Password',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                focusNode: passwordFocusNode,
                obscureText: signUpController.isPasswordObscured.value,
                textInputAction: TextInputAction.next,
                onChanged: signUpController.onPasswordChanged,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
                },
                suffixIcon: IconButton(
                  onPressed: signUpController.togglePasswordVisibility,
                  icon: Icon(
                    signUpController.isPasswordObscured.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Obx(
              () => SignUpInputField(
                label: 'Confirm Password',
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                focusNode: confirmPasswordFocusNode,
                obscureText: signUpController.isConfirmPasswordObscured.value,
                textInputAction: TextInputAction.done,
                onChanged: signUpController.onConfirmPasswordChanged,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
                suffixIcon: IconButton(
                  onPressed: signUpController.toggleConfirmPasswordVisibility,
                  icon: Icon(
                    signUpController.isConfirmPasswordObscured.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            final shouldShow = signUpController.showPasswordValidation.value;
            final emailError = signUpController.emailValidationError.value;
            final passwordError =
                signUpController.passwordValidationError.value;

            if (!shouldShow || (emailError.isEmpty && passwordError.isEmpty)) {
              return const SizedBox.shrink();
            }

            return Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.018,
                left: screenWidth * 0.08,
                right: screenWidth * 0.08,
              ),
              child: Column(
                children: [
                  if (emailError.isNotEmpty)
                    ValidationErrorItem(text: emailError),
                  if (passwordError.isNotEmpty)
                    ValidationErrorItem(text: passwordError),
                ],
              ),
            );
          }),
          SizedBox(height: screenHeight * 0.012),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12),
            child: const Text(
              'By continuing your confirm that you agree with our Term and Condition',
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Colors.orange,
                decorationThickness: 1.5,
                fontSize: 12,
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
            width: screenWidth * 0.92,
            child: ElevatedButton(
              onPressed: onCreateAccount,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Create Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
