import 'package:banana/features/products/data/datasource/product_api_service.dart';
import 'package:banana/features/products/domain/entities/product.dart';

import 'package:intl/intl.dart';

class ProductUtils {
  static List<Product> getFilteredProducts(
      List<Product> products, String searchText) {
    if (searchText.isEmpty) {
      return products;
    } else {
      return products.where((product) {
        return product.title.toLowerCase().contains(searchText.toLowerCase()) ||
            product.brand.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    }
  }

  static Future<List<Product>> fetchProducts() async {
    try {
      return await ProductApiService.fetchProductList();
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  static String formatPrice(double price) {
    final formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(price);
  }
}
