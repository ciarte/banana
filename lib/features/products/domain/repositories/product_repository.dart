import 'package:banana/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts({int limit = 10, int skip = 0});
  Future<Product> getProductById(String productId);
  Future<List<Product>> searchProducts(String query);
}
