import 'package:banana/core/core.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
