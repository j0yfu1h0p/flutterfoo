import 'package:get/get.dart';
import 'package:flutterfoo/src/models/cart_item.dart';
import 'package:flutterfoo/src/models/product_model.dart';

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;

  int get itemCount => cartItems.length;

  double get totalPrice {
    return cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  void addToCart(Product product) {
    final existingIndex = cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex != -1) {
      cartItems[existingIndex].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(CartItem(product: product));
    }

    Get.snackbar(
      'Added to Cart',
      '${product.title} added to cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeFromCart(int productId) {
    cartItems.removeWhere((item) => item.product.id == productId);
  }

  void updateQuantity(int productId, int quantity) {
    if (quantity <= 0) {
      removeFromCart(productId);
      return;
    }

    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      cartItems[index].quantity = quantity;
      cartItems.refresh();
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  bool isInCart(int productId) {
    return cartItems.any((item) => item.product.id == productId);
  }
}
