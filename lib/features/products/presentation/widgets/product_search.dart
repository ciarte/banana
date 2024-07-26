import 'package:flutter/material.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductSearch extends SearchDelegate<Product?> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        final results = provider.getFilteredProducts().where((product) {
          return product.title.toLowerCase().contains(query.toLowerCase());
        }).toList();

        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final product = results[index];
            return ListTile(
              title: Text(product.title),
              subtitle: Text(product.description),
              onTap: () {
                close(context, product);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        final suggestions = provider.getFilteredProducts().where((product) {
          return product.title.toLowerCase().contains(query.toLowerCase());
        }).toList();

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final product = suggestions[index];
            return ListTile(
              title: Text(product.title),
              subtitle: Text(product.description),
              onTap: () {
                query = product.title;
                showResults(context);
              },
            );
          },
        );
      },
    );
  }
}
