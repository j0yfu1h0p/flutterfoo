import "package:flutter/material.dart";
import 'package:flutterfoo/src/controllers/cart_controller.dart';
import 'package:flutterfoo/src/controllers/favorites_controller.dart';
import 'package:flutterfoo/src/bindings/complete_your_profile_binding.dart';
import 'package:flutterfoo/src/bindings/otp_verification_binding.dart';
import 'package:flutterfoo/src/bindings/sign_in_binding.dart';
import 'package:flutterfoo/src/bindings/sign_up_bindings.dart';
import 'package:flutterfoo/src/bindings/splash_screen_binding.dart';
import 'package:flutterfoo/src/bindings/welcome_binding.dart';
import 'package:flutterfoo/src/views/category_products_screen.dart';
import 'package:flutterfoo/src/views/cart_screen.dart';
import 'package:flutterfoo/src/views/checkout_screen.dart';
import 'package:flutterfoo/src/views/complete_your_profile.dart';
import 'package:flutterfoo/src/views/favorites_screen.dart';
import 'package:flutterfoo/src/views/home_screen.dart';
import 'package:flutterfoo/src/views/notification_screen.dart';
import 'package:flutterfoo/src/views/product_details_screen.dart';
import 'package:flutterfoo/src/views/profile_screen.dart';
import 'package:flutterfoo/src/views/otp_verification.dart';
import 'package:flutterfoo/src/views/sign_in.dart';
import 'package:flutterfoo/src/views/sign_up.dart';
import 'package:flutterfoo/src/views/splash_screen.dart';
import 'package:flutterfoo/src/views/welcome_screen.dart';
import 'package:get/get.dart';

void main() {
  // Initialize global controllers
  Get.put(CartController(), permanent: true);
  Get.put(FavoritesController(), permanent: true);

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
        fontFamily: 'SpaceGrotesk',
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
          binding: SplashScreenBinding(),
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
        GetPage(name: '/notification', page: () => const NotificationScreen()),
        GetPage(
          name: '/category_products',
          page: () => const CategoryProductsScreen(),
        ),
        GetPage(
          name: '/product_details',
          page: () => const ProductDetailsScreen(),
        ),
        GetPage(name: '/favorites', page: () => const FavoritesScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/cart', page: () => const CartScreen()),
        GetPage(name: '/checkout', page: () => const CheckoutScreen()),
        GetPage(
          name: '/sign_up',
          page: () => const SignUp(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: '/otp_verification',
          page: () => const OtpVerification(),
          binding: OtpVerificationBinding(),
        ),
        GetPage(
          name: '/complete_your_profile',
          page: () => CompleteYourProfile(),
          binding: CompleteYourProfileBinding(),
        ),
      ],
    );
  }
}
