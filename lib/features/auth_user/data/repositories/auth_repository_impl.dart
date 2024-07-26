import 'package:banana/features/auth_user/data/datasource/aut_api_service.dart';
import 'package:banana/features/auth_user/data/model/model.dart';
import 'package:banana/features/auth_user/domain/entities/user.dart';
import 'package:banana/features/auth_user/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthenticationApiService apiService;

  AuthRepositoryImpl(this.apiService);

  @override
  Future<User> login(String username, String password) {
    return apiService
        .login(LoginDataModel(username: username, password: password));
  }
}
