import 'dart:async';
import 'package:flutter/material.dart';
import 'package:banana/core/presentation/widgets/bad_state.dart';
import 'package:banana/features/products/presentation/viewmodel/product_viewmodel.dart';
import 'package:banana/features/products/presentation/widgets/widgets.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:go_router/go_router.dart';

typedef SearchProductCallback = Future<List<Product>> Function(String query);

class ProductSearchDelegate extends SearchDelegate<Product?> {
  final SearchProductCallback searchProduct;
  final StreamController<List<Product>> debouncedProducts =
      StreamController.broadcast();
  final StreamController<bool> debouncedLoader = StreamController.broadcast();
  Timer? _debounceTimer;

  ProductSearchDelegate({required this.searchProduct});

  void closeStreams() {
    debouncedProducts.close();
    debouncedLoader.close();
  }

  void _onQueryChange(String query) {
    debouncedLoader.add(true);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        debouncedProducts.add([]);
        debouncedLoader.add(false);
        return;
      }
      final products = await searchProduct(query);
      debouncedProducts.add(products);
      debouncedLoader.add(false);
    });
  }

  @override
  String get searchFieldLabel => 'Search your favorites...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        stream: debouncedLoader.stream,
        builder: (context, snapshot) {
          if (snapshot.data ?? false) {
            return IconButton(
              onPressed: () => query = '',
              icon: const Icon(Icons.refresh_rounded),
            );
          }
          return IconButton(
            onPressed: () => query = '',
            icon: const Icon(Icons.clear),
          );
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        closeStreams();
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _onQueryChange(query);

    return StreamBuilder<List<Product>>(
      stream: debouncedProducts.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const BadState(
            text: 'Product not found... try again',
          );
        }
        final suggestions = snapshot.data!;

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final product = suggestions[index];
            return ProductCard(
              product: product,
              formatPrice: ProductViewmodel.formatPrice,
              onTap: () {
                context.go('/main/0/products/${product.id.toString()}');
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChange(query);

    if (query.isEmpty) {
      return const Center(
          child: Text('Type something to search for products...'));
    }

    return StreamBuilder<List<Product>>(
      stream: debouncedProducts.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const BadState(
            text: 'Product not found... try again',
          );
        }
        final suggestions = snapshot.data!;

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final product = suggestions[index];
            return ProductCard(
              product: product,
              formatPrice: ProductViewmodel.formatPrice,
              onTap: () {
                context.go('/main/0/products/${product.id.toString()}');
              },
            );
          },
        );
      },
    );
  }
}
