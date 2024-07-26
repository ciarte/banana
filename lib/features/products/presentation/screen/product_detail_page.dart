import 'package:banana/features/products/data/datasource/product_api_service.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/widgets/detail_product.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;

  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product>(
      future: ProductApiService.fetchProductById(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar el producto'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No se encontró el producto'));
        }

        Product product = snapshot.data!;
        return Scaffold(
          appBar: AppBar(
            title: Text(product.title),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: DetailProduct(product: product),
        );
      },
    );
  }
}
