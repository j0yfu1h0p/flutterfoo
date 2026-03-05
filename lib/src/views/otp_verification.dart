import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/otp_verification_controller.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final OtpVerificationController _controller =
      Get.find<OtpVerificationController>();

  final List<TextEditingController> _digitControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final item in _digitControllers) {
      item.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onDigitChanged(int index, String value) {
    if (value.length > 1) {
      _digitControllers[index].text = value.substring(value.length - 1);
      _digitControllers[index].selection = const TextSelection.collapsed(
        offset: 1,
      );
      value = _digitControllers[index].text;
    }

    if (value.isNotEmpty && index < _focusNodes.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    _controller.onOtpChanged(_digitControllers.map((e) => e.text).join());
  }

  Widget _buildOtpField({
    required int index,
    required double screenWidth,
    required double screenHeight,
  }) {
    return SizedBox(
      width: screenWidth * 0.20,
      height: screenWidth * 0.20,
      child: TextField(
        cursorHeight: screenHeight * 0.03,
        controller: _digitControllers[index],
        focusNode: _focusNodes[index],
        onChanged: (value) => _onDigitChanged(index, value),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        maxLength: 1,

        style: TextStyle(
          fontSize: 32,
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(color: Colors.grey[500]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: const BorderSide(color: Colors.orange, width: 1.8),
          ),
        ),
      ),
    );
  }

  void _onContinuePressed() {
    FocusScope.of(context).unfocus();
    _controller.onContinuePressed();
  }

  void _onResendPressed() {
    for (final item in _digitControllers) {
      item.clear();
    }
    _focusNodes.first.requestFocus();
    _controller.onResendPressed();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OTP Verification',
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.08),
            Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: screenWidth * 0.12,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'We sent your code to your email',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            const SizedBox(height: 6),
            Obx(
              () => RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  children: [
                    const TextSpan(text: 'This code will expired in '),
                    TextSpan(
                      text: _controller.countdownText,
                      style: const TextStyle(color: Color(0xFFFF5A7A)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  child: _buildOtpField(
                    index: index,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.15),
            SizedBox(
              width: screenWidth * 0.92,
              child: ElevatedButton(
                onPressed: _onContinuePressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
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
            SizedBox(height: screenHeight * 0.10),
            Obx(() {
              if (_controller.errorMessage.value.isEmpty) {
                return const SizedBox(height: 30);
              }
              return Text(
                _controller.errorMessage.value,
                style: const TextStyle(color: Color(0xFFFF5A7A), fontSize: 16),
                textAlign: TextAlign.center,
              );
            }),
            GestureDetector(
              onTap: _onResendPressed,
              child: Text(
                'Resend OTP Code',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
