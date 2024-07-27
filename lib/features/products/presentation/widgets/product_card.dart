import 'package:flutter/material.dart';
import 'package:banana/core/core.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/widgets/final_price.dart';
import 'package:banana/features/products/presentation/widgets/widgets.dart';

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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: AppPallete.shadow,
              blurRadius: 20.0,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CoverImage(
                  imageUrl: product.thumbnail,
                  infoText: product.brand.isNotEmpty
                      ? product.brand
                      : product.category.name,
                ),
                Expanded(
                  child: ProductInfo(product: product, onTap: onTap),
                ),
              ],
            ),
            FinalPrice(product: product, formatPrice: formatPrice),
          ],
        ),
      ),
    );
  }
}
