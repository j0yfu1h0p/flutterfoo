import 'package:get/get.dart';
import 'package:flutterfoo/src/models/product_model.dart';

class FavoritesController extends GetxController {
  final RxList<Product> favorites = <Product>[].obs;

  bool isFavorite(int productId) {
    return favorites.any((product) => product.id == productId);
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product.id)) {
      favorites.removeWhere((p) => p.id == product.id);
      Get.snackbar(
        'Removed from Favorites',
        '${product.title} removed from favorites',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } else {
      favorites.add(product);
      Get.snackbar(
        'Added to Favorites',
        '${product.title} added to favorites',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void removeFavorite(int productId) {
    favorites.removeWhere((product) => product.id == productId);
  }
}
