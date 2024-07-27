import 'package:flutter/material.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/data/datasource/product_api_service.dart';
import 'package:banana/features/products/presentation/utils/search_delegate.dart';
import 'package:banana/core/theme/app_pallete.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  Future<List<Product>> searchProducts(String query) async {
    final productService = ProductApiService();
    return productService.searchProducts(query);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            const Icon(
              Icons.live_help_outlined,
              color: AppPallete.colorText1,
            ),
            const SizedBox(width: 8),
            const Text('Banana Software'),
            const Spacer(),
            IconButton(
              onPressed: () {
                showSearch<Product?>(
                  context: context,
                  delegate: ProductSearchDelegate(
                    searchProduct: searchProducts,
                  ),
                );
              },
              icon: const Icon(Icons.search_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
