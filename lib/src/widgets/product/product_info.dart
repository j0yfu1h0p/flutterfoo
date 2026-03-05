import 'package:flutter/material.dart';
import 'package:flutterfoo/src/models/product_model.dart';

class ProductInfo extends StatelessWidget {
  final Product product;

  const ProductInfo({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double titleFontSize = (screenWidth * 0.06).clamp(20.0, 28.0);
    final double priceFontSize = (screenWidth * 0.08).clamp(28.0, 36.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand
        if (product.brand != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEA8735).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              product.brand!,
              style: const TextStyle(
                color: Color(0xFFEA8735),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        const SizedBox(height: 12),

        // Title
        Text(
          product.title,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),

        // Rating and Stock
        Row(
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 20),
            const SizedBox(width: 4),
            Text(
              '${product.rating}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: product.stock > 0
                    ? Colors.green.withOpacity(0.1)
                    : Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                product.stock > 0 ? 'In Stock' : 'Out of Stock',
                style: TextStyle(
                  color: product.stock > 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Price
        Row(
          children: [
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: priceFontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFEA8735),
              ),
            ),
            const SizedBox(width: 12),
            if (product.discountPercentage > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '-${product.discountPercentage.toStringAsFixed(0)}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
