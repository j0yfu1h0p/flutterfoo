import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({Key? key, this.currentIndex = 0}) : super(key: key);

  Future<void> _handleLogout() async {
    final confirm = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      Get.offAllNamed('/welcome');
      Get.snackbar(
        'Logged Out',
        'You have been successfully logged out',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double iconSize = (screenWidth * 0.075).clamp(26.0, 32.0);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              iconSize: iconSize,
              currentIndex: currentIndex,
              onTap: (index) async {
                if (index == 2) {
                  Get.toNamed('/favorites');
                } else if (index == 3) {
                  Get.toNamed('/profile');
                } else if (index == 4) {
                  await _handleLogout();
                }
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.logout),
                  label: 'Logout',
                ),
              ],
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
            ),
          ),
        ),
      ),
    );
  }
}
