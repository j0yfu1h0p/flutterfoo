import 'package:flutter/material.dart';

import '../sign_up/sign_up_input_field.dart';

class CompleteProfileFormSection extends StatelessWidget {
  const CompleteProfileFormSection({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.firstNameFocusNode,
    required this.lastNameFocusNode,
    required this.phoneFocusNode,
    required this.addressFocusNode,
    required this.onFirstNameChanged,
    required this.onLastNameChanged,
    required this.onPhoneChanged,
    required this.onAddressChanged,
    required this.onContinue,
  });

  final double screenWidth;
  final double screenHeight;
  final FocusNode firstNameFocusNode;
  final FocusNode lastNameFocusNode;
  final FocusNode phoneFocusNode;
  final FocusNode addressFocusNode;
  final ValueChanged<String> onFirstNameChanged;
  final ValueChanged<String> onLastNameChanged;
  final ValueChanged<String> onPhoneChanged;
  final ValueChanged<String> onAddressChanged;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: SignUpInputField(
            label: 'First Name',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            focusNode: firstNameFocusNode,
            onChanged: onFirstNameChanged,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(lastNameFocusNode);
            },
            suffixIcon: Icon(Icons.person_outline, color: Colors.grey[400]),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: SignUpInputField(
            label: 'Last Name',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            focusNode: lastNameFocusNode,
            onChanged: onLastNameChanged,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(phoneFocusNode);
            },
            suffixIcon: Icon(Icons.person_outline, color: Colors.grey[400]),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: SignUpInputField(
            label: 'Phone Number',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            focusNode: phoneFocusNode,
            onChanged: onPhoneChanged,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(addressFocusNode);
            },
            suffixIcon: Icon(Icons.phone_outlined, color: Colors.grey[400]),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: SignUpInputField(
            label: 'Address',
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            focusNode: addressFocusNode,
            onChanged: onAddressChanged,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) {
              FocusScope.of(context).unfocus();
            },
            suffixIcon: Icon(
              Icons.location_on_outlined,
              color: Colors.grey[400],
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.05),
        SizedBox(
          width: screenWidth * 0.92,
          child: ElevatedButton(
            onPressed: onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              'Continue',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.05),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12),
          child: const Text(
            'By continuing you accept our Terms and Conditions',
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
      ],
    );
  }
}
