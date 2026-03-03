import "package:flutter/material.dart";
import 'package:flutterfoo/src/controllers/sign_in_binding.dart';
import 'package:flutterfoo/src/controllers/sign_up_bindings.dart';
import 'package:flutterfoo/src/controllers/welcome_binding.dart';
import 'package:flutterfoo/src/views/home_screen.dart';
import 'package:flutterfoo/src/views/sign_in.dart';
import 'package:flutterfoo/src/views/sign_up.dart';
import 'package:flutterfoo/src/views/welcome_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const WelcomeScreen(),
          binding: WelcomeBinding(),
        ),
        GetPage(
          name: '/welcome',
          page: () => const WelcomeScreen(),
          binding: WelcomeBinding(),
        ),
        GetPage(
          name: '/sign_in',
          page: () => SignIn(),
          binding: SignInBinding(),
        ),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(
          name: '/sign_up',
          page: () => const SignUp(),
          binding: SignUpBinding(),
        ),
      ],
    );
  }
}
