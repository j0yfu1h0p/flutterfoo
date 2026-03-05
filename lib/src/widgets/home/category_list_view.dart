import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterfoo/src/controllers/home_screen_controller.dart';
import 'package:flutterfoo/src/widgets/home/category_card.dart';
import 'package:flutterfoo/src/widgets/skeleton_card.dart';

class CategoryListView extends StatelessWidget {
  final HomeScreenController controller;
  final List<int> randomIndexes;

  const CategoryListView({
    Key? key,
    required this.controller,
    required this.randomIndexes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = (screenWidth * 0.62).clamp(220.0, 300.0);
    final double cardHeight = (screenWidth * 0.37).clamp(120.0, 170.0);

    return SizedBox(
      height: cardHeight,
      child: Obx(() {
        if (controller.isLoading.value) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SkeletonCard(width: cardWidth, height: cardHeight),
            ),
          );
        }

        if (controller.error.value != null) {
          return Center(child: Text('Error: ${controller.error.value}'));
        }

        if (controller.categoryList.isEmpty) {
          return const Center(child: Text('No categories available'));
        }

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: randomIndexes.length,
          itemBuilder: (BuildContext context, int index) {
            final randomIndex = randomIndexes[index];
            final categoryName = controller.categoryList[randomIndex];
            final imageUrl = controller.getCategoryImageUrl(categoryName);

            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CategoryCard(
                imageUrl: imageUrl,
                title: categoryName,
                onTap: () {
                  Get.toNamed('/category_products', arguments: categoryName);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
