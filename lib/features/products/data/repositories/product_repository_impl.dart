import 'package:banana/features/products/data/datasource/product_api_service.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductApiService productApiService;
  ProductRepositoryImpl(this.productApiService);

  @override
  Future<List<Product>> getAllProducts() {
    return productApiService.fetchProductList();
  }

  @override
  Future<Product> getProductById(String productId) {
    return productApiService.fetchProductById(productId);
  }

  @override
  Future<List<Product>> searchProducts(String query) {
    return productApiService.searchProducts(query);
  }
}
