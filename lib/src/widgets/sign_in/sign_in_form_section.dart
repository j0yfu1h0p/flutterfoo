import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/sign_in_controller.dart';

class SignInFormSection extends StatelessWidget {
  const SignInFormSection({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.signInController,
  });

  final double screenWidth;
  final double screenHeight;
  final SignInController signInController;

  Future<void> _openForgotPasswordLink() async {
    final uri = Uri.parse('https://yourdomain.com/forgot-password');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
            ),
            child: Obx(
              () => TextFormField(
                enabled: !signInController.isLoading.value,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your email'
                    : null,
                onChanged: (value) => signInController.email = value,
                cursorColor: Colors.orange,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.grey[600],
                  letterSpacing: screenWidth * 0.01,
                ),
                decoration: InputDecoration(
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 14.0),
                    child: Icon(Icons.email_outlined, color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.02,
                    bottom: screenHeight * 0.02,
                    right: screenWidth * 0.06,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                      width: 2.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(color: Colors.red, width: 2.5),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.orange,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
            ),
            child: Obx(
              () => TextFormField(
                enabled: !signInController.isLoading.value,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your password'
                    : null,
                onChanged: (value) => signInController.password = value,
                obscureText: signInController.isPasswordVisible.value,
                cursorColor: Colors.orange,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.grey[600],
                  letterSpacing: screenWidth * 0.01,
                ),
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: IconButton(
                      icon: Icon(
                        signInController.isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        signInController.isPasswordVisible.value =
                            !signInController.isPasswordVisible.value;
                      },
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.02,
                    bottom: screenHeight * 0.02,
                    right: screenWidth * 0.06,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(color: Colors.red, width: 2.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                      width: 2.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2.5,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.orange,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.04,
                  top: screenHeight * 0.01,
                ),
                child: Obx(
                  () => Checkbox(
                    focusColor: Colors.orange,
                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.orange;
                      }
                      return Colors.white;
                    }),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 2.5,
                      ),
                    ),
                    checkColor: Colors.white,
                    value: signInController.isRememberMeChecked.value,
                    onChanged: (bool? value) {
                      signInController.toggleRememberMe();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: screenWidth * 0.04,
                  top: screenHeight * 0.01,
                ),
                child: Text(
                  'Remember me',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  right: screenWidth * 0.04,
                  top: screenHeight * 0.01,
                ),
                child: InkWell(
                  onTap: _openForgotPasswordLink,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: screenWidth * 0.035,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: SizedBox(
              width: double.infinity,
              height: screenHeight * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: signInController.isLoading.value
                    ? null
                    : () => signInController.signIn(),
                child: Obx(
                  () => signInController.isLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                            strokeWidth: 2.5,
                          ),
                        )
                      : Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.045,
                          ),
                        ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.035),
        ],
      ),
    );
  }
}
