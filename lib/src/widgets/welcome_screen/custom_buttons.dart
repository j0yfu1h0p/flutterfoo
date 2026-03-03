import 'package:flutter/material.dart';

class CustomContinueButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const CustomContinueButton(
    this.onPressed, {
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topPadding = (size.height * 0.15).clamp(24.0, 150.0);
    final buttonWidth = (size.width * 0.56).clamp(180.0, 300.0);
    final buttonHeight = (size.height * 0.065).clamp(46.0, 56.0);
    final fontSize = (size.width * 0.043).clamp(14.0, 18.0);

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: SizedBox(
        width: buttonWidth,
        height: buttonHeight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
