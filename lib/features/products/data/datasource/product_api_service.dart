import 'package:banana/core/config/config.dart';
import 'package:banana/features/products/data/model/productdb_model.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/domain/mappers/produc_mapper.dart';
import 'package:dio/dio.dart';

class ProductApiService {
  static final Dio _dio = Dio();
  static const String baseUrl = Config.baseUrl;

  static Future<List<Product>> fetchProductList() async {
    try {
      Response response = await _dio.get(
        '$baseUrl/products',
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null && data['products'] != null) {
          List<dynamic> productList = data['products'];
          List<ProductDB> productDBList =
              productList.map((json) => ProductDB.fromJson(json)).toList();
          List<Product> products = productDBList
              .map((productDB) => ProductMapper.productDBtoEntity(productDB))
              .toList();
          return products;
        } else {
          throw Exception('Products data is null');
        }
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch product list');
    }
  }

  static Future<Product> fetchProductById(String id) async {
    try {
      Response response = await _dio.get(
        '$baseUrl/products/$id',
      );

      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data != null) {
          ProductDB productDb = ProductDB.fromJson(data);
          final product = ProductMapper.productDBtoEntity(productDb);
          return product;
        } else {
          throw Exception('Product data is null');
        }
      } else {
        throw Exception('Failed to fetch product');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch product');
    }
  }

  static Future<List<ProductDB>> searchProducts(String query) async {
    try {
      Response response = await _dio.get(
        '$baseUrl/products/search',
        queryParameters: {
          'q': query,
        },
      );

      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data != null && data['products'] != null) {
          List<dynamic> productList = data['products'];
          List<ProductDB> products =
              productList.map((json) => ProductDB.fromJson(json)).toList();
          return products;
        } else {
          throw Exception('Products data is null');
        }
      } else {
        throw Exception('Failed to search products');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to search products');
    }
  }
}
