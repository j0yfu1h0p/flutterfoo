import 'package:flutter/material.dart';

class SignUpHeaderSection extends StatelessWidget {
  const SignUpHeaderSection({super.key, required this.screenHeight});

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.075),
        const Text(
          'Register Account',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenHeight * 0.02),
        const Text(
          'Complete your details or continue\nwith social media',
          style: TextStyle(fontSize: 20, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenHeight * 0.075),
      ],
    );
  }
}
