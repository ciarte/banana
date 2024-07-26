import 'package:banana/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function(double) formatPrice;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.formatPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('USD: ${formatPrice(product.price)}'),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.brand),
              const SizedBox(height: 20),
              Text(product.description),
            ],
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
