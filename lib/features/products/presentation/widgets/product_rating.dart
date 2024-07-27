import 'package:flutter/material.dart';
import 'package:banana/core/theme/app_pallete.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
    required this.productRating,
  });

  final double productRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Stack(
          children: [
            const Icon(
              size: 30,
              Icons.star_border,
              color: Colors.black,
            ),
            Icon(
              size: 30,
              color: AppPallete.borderColor,
              index < productRating ? Icons.star : Icons.star_outline,
            ),
          ],
        );
      }),
    );
  }
}
