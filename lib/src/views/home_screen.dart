import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterfoo/src/controllers/cart_controller.dart';
import 'package:flutterfoo/src/controllers/home_screen_controller.dart';
import 'package:flutterfoo/src/widgets/home/top_badge_button.dart';
import 'package:flutterfoo/src/widgets/home/action_item.dart';
import 'package:flutterfoo/src/widgets/home/promo_banner.dart';
import 'package:flutterfoo/src/widgets/home/section_header.dart';
import 'package:flutterfoo/src/widgets/home/category_list_view.dart';
import 'package:flutterfoo/src/widgets/home/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    final cartController = Get.find<CartController>();
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar with Cart and Notification Buttons
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Obx(
                    () => TopBadgeButton(
                      icon: Icons.shopping_cart,
                      onTap: () => Get.toNamed('/cart'),
                      badgeCount: cartController.itemCount,
                    ),
                  ),
                  const SizedBox(width: 5),
                  TopBadgeButton(
                    icon: Icons.notifications_none_outlined,
                    onTap: () => Get.toNamed('/notification'),
                  ),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Promo Banner
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        left: 12,
                        right: 12,
                      ),
                      child: const PromoBanner(
                        title: 'Summer Sale!',
                        subtitle: 'Cashback 20%',
                      ),
                    ),

                    // Action Items Row
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ActionItem(
                              icon: Icons.bolt_outlined,
                              label: 'Flash\nDeal',
                            ),
                            SizedBox(width: 12),
                            ActionItem(
                              icon: Icons.receipt_outlined,
                              label: 'Bill',
                            ),
                            SizedBox(width: 12),
                            ActionItem(
                              icon: Icons.sports_esports_outlined,
                              label: 'Game',
                            ),
                            SizedBox(width: 12),
                            ActionItem(
                              icon: Icons.card_giftcard_outlined,
                              label: 'Daily\nGift',
                            ),
                            SizedBox(width: 12),
                            ActionItem(
                              icon: Icons.more_outlined,
                              label: 'More',
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Special for you Section
                    const SectionHeader(title: 'Special for you'),
                    CategoryListView(
                      controller: controller,
                      randomIndexes: controller.randomIndexes,
                    ),

                    // Popular Products Section
                    const SectionHeader(title: 'Popular Products'),
                    CategoryListView(
                      controller: controller,
                      randomIndexes: controller.randomIndexes2,
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
