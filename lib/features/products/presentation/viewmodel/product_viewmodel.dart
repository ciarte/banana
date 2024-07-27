import 'package:intl/intl.dart';
import 'package:banana/features/products/data/datasource/product_api_service.dart';
import 'package:banana/features/products/domain/entities/product.dart';

class ProductViewmodel {
  static final ProductApiService productApiService = ProductApiService();

  List<Product> getFilteredProducts(List<Product> products, String searchText) {
    if (searchText.isEmpty) {
      return products;
    } else {
      return products.where((product) {
        return product.title.toLowerCase().contains(searchText.toLowerCase()) ||
            product.brand.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    }
  }

  static String formatPrice(double price) {
    final formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(price);
  }

  static String applyDiscount(double price, double discountPercentage) {
    final total = price - (price * discountPercentage / 100);
    return formatPrice(total);
  }
}
