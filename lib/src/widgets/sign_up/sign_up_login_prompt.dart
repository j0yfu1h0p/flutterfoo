import 'package:flutter/material.dart';

class SignUpLoginPrompt extends StatelessWidget {
  const SignUpLoginPrompt({
    super.key,
    required this.screenWidth,
    required this.onLoginPressed,
  });

  final double screenWidth;
  final VoidCallback onLoginPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: screenWidth * 0.038,
          ),
        ),
        TextButton(
          onPressed: onLoginPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.orange,
              fontSize: screenWidth * 0.038,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
