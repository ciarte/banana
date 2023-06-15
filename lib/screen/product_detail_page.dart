import 'package:banana/config/app_theme.dart';
import 'package:banana/widgets/detail_store.dart';
import 'package:flutter/material.dart';
import 'package:banana/model/product_model.dart';
import 'package:banana/service/api_services.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;

  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme().getTheme();
    return FutureBuilder<Product>(
      future: ApiService.fetchProductById(id),
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
            backgroundColor: theme.primaryColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: DetailStore(product: product, theme: theme),
        );
      },
    );
  }
}
