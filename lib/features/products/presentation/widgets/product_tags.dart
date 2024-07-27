import 'package:flutter/material.dart';
import 'package:banana/core/theme/app_pallete.dart';

class ProductTags extends StatelessWidget {
  const ProductTags({
    super.key,
    required this.productTags,
  });

  final List<String> productTags;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          Wrap(
            spacing: 10,
            children: (productTags).map((tag) {
              return Text(
                '#$tag',
                style:
                    const TextStyle(fontSize: 16, color: AppPallete.colorText2),
              );
            }).toList(),
          )
        ]));
  }
}
