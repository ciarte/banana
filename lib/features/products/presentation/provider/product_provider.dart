import 'package:banana/features/products/data/datasource/product_api_service.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/viewmodel/product_viewmodel.dart';

import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  Product? _product;
  bool _isLoading = false;
  String _searchText = '';
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final ProductApiService productService;
  ProductProvider(this.productService) {
    fetchProducts();
  }

  List<Product> get products => _products;
  Product? get product => _product;
  bool get isLoading => _isLoading;
  String get searchText => _searchText;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<Product> products = await productService.fetchProductList();
      _products = products;
    } catch (e) {
      print('Error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<Product> fetchProductById(String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      final fetchedProduct = await productService.fetchProductById(id);

      _product = fetchedProduct;
      return _product!;
    } catch (e) {
      print('Error al cargar el producto: $e');
      throw Exception('Error al cargar el producto: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<Product> getFilteredProducts() {
    return ProductViewmodel().getFilteredProducts(_products, _searchText);
  }

  void updateSearchText(String value) {
    _searchText = value;
    notifyListeners();
  }
}
