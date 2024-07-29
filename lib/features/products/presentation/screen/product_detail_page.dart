import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/provider/product_provider.dart';
import 'package:banana/features/products/presentation/widgets/detail_product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  static const String name = 'details';
  final String id;

  const ProductDetailPage({super.key, required this.id});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false)
          .fetchProductById(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        if (productProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (productProvider.errorMessage != null) {
          return Center(child: Text(productProvider.errorMessage!));
        } else if (productProvider.product == null) {
          return const Center(child: Text('No se encontró el producto'));
        }

        Product product = productProvider.product!;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          body: DetailProduct(product: product),
        );
      },
    );
  }
}
