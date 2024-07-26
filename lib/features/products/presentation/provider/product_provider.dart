import 'package:banana/features/products/data/datasource/product_api_service.dart';
import 'package:banana/features/products/domain/entities/product.dart';

import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<Product> products = await ProductApiService.fetchProductList();
      _products = products;
    } catch (e) {
      print('Error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
