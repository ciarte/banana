import 'package:banana/core/config/config.dart';
import 'package:banana/core/errors/exception.dart';
import 'package:banana/features/auth_user/data/model/login_data_model.dart';
import 'package:banana/features/auth_user/domain/entities/user.dart';
import 'package:banana/features/auth_user/domain/mapper/user_mapper.dart';
import 'package:dio/dio.dart';

String apiUrl = Enviroments.apiUrl;

class AuthenticationApiService {
  static final Dio _dio = Dio();
  String baseUrl = apiUrl;

  Future<User> login(LoginDataModel loginData) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/auth/login',
        data: {
          'username': loginData.username,
          'password': loginData.password,
        },
      );

      if (response.statusCode == 200) {
        final user = UserMapper.userJsonToEntity(response.data);
        return user;
      } else {
        throw ServerException('Invalid Credentials');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        throw ServerException('Wrong Credentials');
      } else {
        throw ServerException('Connection error: ${dioError.message}');
      }
    } catch (e) {
      throw ServerException('Unexpected error: $e');
    }
  }
}
