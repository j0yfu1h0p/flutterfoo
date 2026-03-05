import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterfoo/src/controllers/profile_controller.dart';
import 'package:flutterfoo/src/controllers/favorites_controller.dart';
import 'package:flutterfoo/src/controllers/cart_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController(), permanent: true);
    final favoritesController = Get.find<FavoritesController>();
    final cartController = Get.find<CartController>();

    Widget profileField({
      required String label,
      required TextEditingController textController,
      required IconData icon,
      bool obscureText = false,
    }) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: TextField(
          controller: textController,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: Icon(icon, color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(26)),
              borderSide: BorderSide(color: Color(0xFFEA8735)),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFEA8735),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFEA8735)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 44,
                backgroundColor: Color(0xFFE9B48A),
                child: Icon(Icons.person, size: 44, color: Colors.white),
              ),
              const SizedBox(height: 22),

              profileField(
                label: 'First Name',
                textController: controller.firstNameController,
                icon: Icons.person_outline,
              ),
              profileField(
                label: 'Last Name',
                textController: controller.lastNameController,
                icon: Icons.person_outline,
              ),
              profileField(
                label: 'Phone Number',
                textController: controller.phoneController,
                icon: Icons.phone_android_outlined,
              ),
              profileField(
                label: 'Email',
                textController: controller.emailController,
                icon: Icons.mail_outline,
              ),
              profileField(
                label: 'Password',
                textController: controller.passwordController,
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              profileField(
                label: 'Address',
                textController: controller.addressController,
                icon: Icons.location_on_outlined,
              ),
              profileField(
                label: 'Postal code',
                textController: controller.postalCodeController,
                icon: Icons.location_on_outlined,
              ),
              profileField(
                label: 'Home Number',
                textController: controller.homeNumberController,
                icon: Icons.location_on_outlined,
              ),

              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEA8735),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => Get.toNamed('/favorites'),
                      icon: Obx(
                        () => Text('${favoritesController.favorites.length}'),
                      ),
                      label: const Text('Favorites'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => Get.toNamed('/cart'),
                      icon: Obx(() => Text('${cartController.itemCount}')),
                      label: const Text('Cart'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
