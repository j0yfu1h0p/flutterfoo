import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterfoo/src/models/product_model.dart';
import 'package:flutterfoo/src/controllers/cart_controller.dart';
import 'package:flutterfoo/src/controllers/favorites_controller.dart';
import 'package:flutterfoo/src/widgets/product/product_image_gallery.dart';
import 'package:flutterfoo/src/widgets/product/product_info.dart';
import 'package:flutterfoo/src/widgets/product/product_description.dart';
import 'package:flutterfoo/src/widgets/product/product_tags.dart';
import 'package:flutterfoo/src/widgets/product/add_to_cart_bottom_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments as Product;
    final cartController = Get.find<CartController>();
    final favoritesController = Get.find<FavoritesController>();
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = (screenHeight * 0.5).clamp(300.0, 500.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: appBarHeight,
            pinned: true,
            backgroundColor: const Color(0xFFEA8735),
            iconTheme: const IconThemeData(color: Color(0xFFEA8735)),
            actions: [
              Obx(
                () => IconButton(
                  icon: Icon(
                    favoritesController.isFavorite(product.id)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: favoritesController.isFavorite(product.id)
                        ? Colors.red
                        : Colors.white,
                  ),
                  onPressed: () {
                    favoritesController.toggleFavorite(product);
                  },
                ),
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: ProductImageGallery(images: product.images),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductInfo(product: product),
                  const SizedBox(height: 24),
                  ProductDescription(description: product.description),
                  const SizedBox(height: 24),
                  ProductTags(tags: product.tags),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AddToCartBottomBar(
        product: product,
        onAddToCart: () => cartController.addToCart(product),
      ),
    );
  }
}
