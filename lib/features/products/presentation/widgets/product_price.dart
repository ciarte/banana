import 'package:flutter/material.dart';
import 'package:banana/core/core.dart';
import 'package:banana/features/products/presentation/viewmodel/product_viewmodel.dart';

class ProductTotalPrice extends StatelessWidget {
  const ProductTotalPrice({
    super.key,
    required this.price,
    required this.discountPercentage,
  });

  final double price;
  final double discountPercentage;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${ProductViewmodel.applyDiscount(price, discountPercentage)}',
      style: const TextStyle(
          color: AppPallete.colorText2,
          fontSize: 30,
          fontWeight: FontWeight.bold),
    );
  }
}
