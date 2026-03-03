import 'package:flutter/material.dart';

class SignInSignUpPrompt extends StatelessWidget {
  const SignInSignUpPrompt({
    super.key,
    required this.screenWidth,
    required this.onSignUpPressed,
  });

  final double screenWidth;
  final VoidCallback onSignUpPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account? ',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.normal,
          ),
        ),
        InkWell(
          onTap: onSignUpPressed,
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.orange,
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
