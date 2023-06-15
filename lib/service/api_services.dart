
import 'package:banana/model/models.dart';
import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio();
  static const String baseUrl = 'https://dummyjson.com';

  static Future<bool> verifyCredentials(
      String username, String password) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return true; 
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  static Future<List<Product>> fetchProductList() async {
    try {
      Response response = await _dio.get(
        '$baseUrl/products',
      );

      if (response.statusCode == 200) {
        dynamic data = response.data;
       if (data != null && data['products'] != null) {
          List<dynamic> productList = data['products'];
          List<Product> products =
              productList.map((json) => Product.fromJson(json)).toList();
          return products;
        } else {
          throw Exception('Products data is null');
        }
      } else {
        throw Exception('Failed  products');
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
        Product product = Product.fromJson(data);
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

  static Future<List<Product>> searchProducts(String query) async {
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
          List<Product> products =
              productList.map((json) => Product.fromJson(json)).toList();
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
