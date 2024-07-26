import 'package:banana/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById(String productId);
  Future<List<Product>> searchProducts(String query);
}
