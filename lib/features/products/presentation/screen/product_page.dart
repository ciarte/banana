import 'package:banana/core/widgets/custom_app_bar.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banana/features/products/presentation/provider/product_provider.dart';
import 'package:banana/features/products/presentation/viewmodel/product_viewmodel.dart';
import 'package:banana/features/products/presentation/widgets/product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomAppBar(),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              provider.getFilteredProducts().isEmpty
                  ? Center(
                      child: Text(
                          'No se encontraron resultados para "${provider.searchText}"'))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: provider.getFilteredProducts().length,
                        itemBuilder: (context, index) {
                          Product product =
                              provider.getFilteredProducts()[index];
                          return ProductCard(
                            product: product,
                            formatPrice: ProductViewmodel.formatPrice,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailPage(
                                      id: product.id.toString()),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
