
import 'package:banana/model/models.dart';
import 'package:banana/service/api_services.dart';
import 'package:intl/intl.dart';

class ProductUtils {
  static List<Product> getFilteredProducts(List<Product> products, String searchText) {
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
      return await ApiService.fetchProductList();
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
