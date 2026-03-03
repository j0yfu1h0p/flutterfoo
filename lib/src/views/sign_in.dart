import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/sign_in_controller.dart';
import '../widgets/sign_in/sign_in_form_section.dart';
import '../widgets/sign_in/sign_in_header_section.dart';
import '../widgets/sign_in/sign_in_signup_prompt.dart';
import '../widgets/sign_in/sign_in_social_section.dart';
import '../widgets/sign_in/tester_notes_dialog.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  late final AnimationController _bounceController;
  late final Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _bounceAnimation =
        TweenSequence<double>([
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.25), weight: 40),
          TweenSequenceItem(tween: Tween(begin: 1.25, end: 0.9), weight: 20),
          TweenSequenceItem(tween: Tween(begin: 0.9, end: 1.1), weight: 20),
          TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 20),
        ]).animate(
          CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
        );

    // Bounce every 3 seconds
    Future.delayed(const Duration(seconds: 1), _startPeriodicBounce);
  }

  void _startPeriodicBounce() {
    if (!mounted) return;
    _bounceController.forward(from: 0).then((_) {
      Future.delayed(const Duration(seconds: 3), _startPeriodicBounce);
    });
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  Future<void> _openSocialLink(String link) async {
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final signInController = Get.find<SignInController>();
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: ScaleTransition(
        scale: _bounceAnimation,
        child: FloatingActionButton.small(
          onPressed: () => showTesterNotesDialog(context),
          backgroundColor: Colors.orange,
          tooltip: 'Tester Notes',
          child: const Icon(Icons.bug_report, color: Colors.white),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: const Text("Sign In"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SignInHeaderSection(screenWidth: screenWidth),
              SignInFormSection(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                signInController: signInController,
              ),
              SignInSocialSection(
                screenWidth: screenWidth,
                onOpenSocialLink: _openSocialLink,
              ),
              SizedBox(height: screenHeight * 0.04),
              SignInSignUpPrompt(
                screenWidth: screenWidth,
                onSignUpPressed: () {
                  Get.toNamed('/sign_up');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
