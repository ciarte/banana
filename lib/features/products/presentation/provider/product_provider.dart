import 'package:banana/features/products/data/datasource/product_api_service.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/presentation/viewmodel/product_viewmodel.dart';

import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  Product? _product;
  bool _isLoading = false;
  bool _isFetching = false;
  String? _errorMessage;
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
  bool get isFetching => _isFetching;
  String get searchText => _searchText;
  int limit = 10;
  int skip = 0;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _isFetching = true;
    _errorMessage = null;
    notifyListeners();

    try {
      List<Product> products = await productService.fetchProductList();
      if (products.isNotEmpty) {
        _products = products;
      }
      skip += limit;
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isFetching = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    if (isFetching) return;
    _isFetching = true;
    _errorMessage = null;
    notifyListeners();
    try {
      List<Product> moreProducts =
          await productService.fetchProductList(skip: skip);
      skip += limit;
      if (products.isNotEmpty) {
        _products.addAll(moreProducts);
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  Future<Product> fetchProductById(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final fetchedProduct = await productService.fetchProductById(id);

      _product = fetchedProduct;
      return _product!;
    } catch (e) {
      _errorMessage = 'Error al cargar el producto: $e';
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
