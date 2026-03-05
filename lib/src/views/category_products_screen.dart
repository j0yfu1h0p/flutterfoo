import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterfoo/src/controllers/category_products_controller.dart';
import 'package:flutterfoo/src/widgets/skeleton_card.dart';
import 'package:flutterfoo/src/widgets/product/product_grid_card.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({Key? key}) : super(key: key);

  String _resolveCategoryName(dynamic args) {
    if (args is String) return args;
    if (args is Map && args['category'] is String)
      return args['category'] as String;
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final String categoryName = _resolveCategoryName(Get.arguments);
    final controller = Get.put(
      CategoryProductsController(categoryName: categoryName),
      tag: categoryName,
    );

    final double screenWidth = MediaQuery.of(context).size.width;
    final int crossAxisCount = screenWidth > 600 ? 3 : 2;
    final double spacing = (screenWidth * 0.04).clamp(12.0, 20.0);
    final double titleFontSize = (screenWidth * 0.05).clamp(18.0, 24.0);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color(0xFFEA8735),
            fontSize: titleFontSize,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFEA8735)),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Padding(
            padding: EdgeInsets.all(spacing),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: 0.75,
              ),
              itemCount: 6,
              itemBuilder: (context, index) => const SkeletonCard(
                width: double.infinity,
                height: double.infinity,
                borderRadius: 16,
              ),
            ),
          );
        }

        if (controller.error.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    controller.error.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: (screenWidth * 0.04).clamp(14.0, 18.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.fetchProducts,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEA8735),
                    padding: EdgeInsets.symmetric(
                      horizontal: spacing * 2,
                      vertical: spacing,
                    ),
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (controller.products.isEmpty) {
          return const Center(child: Text('No products found'));
        }

        return Padding(
          padding: EdgeInsets.all(spacing),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
              childAspectRatio: 0.75,
            ),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return ProductGridCard(product: product);
            },
          ),
        );
      }),
    );
  }
}
