import 'package:flutter/material.dart';

class SignUpInputField extends StatelessWidget {
  const SignUpInputField({
    super.key,
    required this.label,
    required this.screenWidth,
    required this.screenHeight,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.suffixIcon,
  });

  final String label;
  final double screenWidth;
  final double screenHeight;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      cursorColor: Colors.orange,
      style: TextStyle(
        fontSize: screenWidth * 0.04,
        color: Colors.grey[600],
        letterSpacing: screenWidth * 0.01,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.only(
          left: screenWidth * 0.06,
          top: screenHeight * 0.02,
          bottom: screenHeight * 0.02,
          right: screenWidth * 0.06,
        ),
        label: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: screenWidth * 0.04,
            ),
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Colors.red, width: 2.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey[400]!, width: 2.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Colors.orange, width: 2.5),
        ),
        labelStyle: TextStyle(
          color: Colors.orange,
          fontSize: screenWidth * 0.04,
        ),
      ),
    );
  }
}
