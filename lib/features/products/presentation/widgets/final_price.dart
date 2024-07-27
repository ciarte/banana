import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/viewmodel/product_viewmodel.dart';
import 'package:flutter/material.dart';

class FinalPrice extends StatelessWidget {
  const FinalPrice({
    super.key,
    required this.product,
    required this.formatPrice,
  });

  final Product product;
  final Function(double p1) formatPrice;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12,
      right: 15,
      child: Column(
        children: [
          Text(
            'Now:',
            style: TextStyle(
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(3, 3),
                  blurRadius: 3,
                ),
              ],
            ),
          ),
          Text(
            ProductViewmodel.applyDiscount(
                product.price, product.discountPercentage),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(
            formatPrice(product.price),
            style: const TextStyle(
                color: Colors.red, decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
