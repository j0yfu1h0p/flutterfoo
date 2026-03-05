import 'package:flutter/material.dart';
import 'package:flutterfoo/src/models/product_model.dart';

class AddToCartBottomBar extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const AddToCartBottomBar({
    Key? key,
    required this.product,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonHeight = (screenWidth * 0.13).clamp(50.0, 64.0);
    final double fontSize = (screenWidth * 0.04).clamp(14.0, 18.0);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: product.stock > 0 ? onAddToCart : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEA8735),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: buttonHeight * 0.25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
