import 'package:banana/core/config/config.dart';
import 'package:banana/core/errors/exception.dart';
import 'package:banana/features/products/data/model/productdb_model.dart';
import 'package:banana/features/products/domain/entities/product.dart';
import 'package:banana/features/products/domain/mappers/produc_mapper.dart';
import 'package:dio/dio.dart';

String apiUrl = Enviroments.apiUrl;

class ProductApiService {
  static final Dio _dio = Dio();
  String baseUrl = apiUrl;

  Future<List<Product>> fetchProductList({int limit = 10, int skip = 0}) async {
    try {
      Response response = await _dio.get(
        '$baseUrl/products',
        queryParameters: {'limit': limit, 'skip': skip},
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
          throw ServerException('Products data is null');
        }
      } else {
        throw ServerException('Failed to fetch products');
      }
    } catch (e) {
      throw ServerException('Failed to fetch product list $e');
    }
  }

  Future<Product> fetchProductById(String id) async {
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
          throw ServerException('Product data is null');
        }
      } else {
        throw ServerException('Failed to fetch product');
      }
    } catch (e) {
      throw ServerException('Failed to fetch product $e');
    }
  }

  Future<List<Product>> searchProducts(String query) async {
    try {
      Response response = await _dio.get(
        '$baseUrl/products/search',
        queryParameters: {
          'q': query,
        },
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
          throw ServerException('Products data is null');
        }
      } else {
        throw ServerException('Failed to search products');
      }
    } catch (e) {
      throw ServerException('Failed to search products $e');
    }
  }
}
