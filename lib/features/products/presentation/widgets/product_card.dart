import 'package:banana/core/theme/app_pallete.dart';
import 'package:banana/core/widgets/custom_filled_button.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/viewmodel/product_viewmodel.dart';

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
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: AppPallete.borderColor, blurRadius: 10),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const SizedBox(
                                height: 180,
                                width: 120,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                          },
                          height: 140,
                          width: 120,
                          product.thumbnail,
                          filterQuality: FilterQuality.medium,
                          fit: BoxFit.contain,
                        ),
                      ),
                      product.brand.isNotEmpty
                          ? Text(product.brand)
                          : Text(product.category.name)
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${product.title}.',
                            style: const TextStyle(
                                color: AppPallete.colorText1,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        Text(
                          product.description.length > 50
                              ? '${product.description.substring(0, 50)}...'
                              : product.description,
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 5,
                          ),
                        ),
                        CustomFilledButton(
                          text: 'Reed More',
                          buttonColor: AppPallete.focusBorderColor,
                          onPressed: onTap,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
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
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    formatPrice(product.price),
                    style: const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
