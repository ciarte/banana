import 'package:banana/core/config/config.dart';
import 'package:dio/dio.dart';

class AuthenticationApiService {
  static final Dio _dio = Dio();
  static const String baseUrl = Config.baseUrl;

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
}
