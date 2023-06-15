import 'package:banana/model/product_model.dart';
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
        return true; // Credenciales válidas
      } else {
        return false; // Credenciales inválidas
      }
    } catch (e) {
      print('Error: $e');
      return false; // Error en la solicitud HTTP
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
}
