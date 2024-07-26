import 'package:banana/features/auth_user/domain/repositories/auth_repository.dart';
import 'package:banana/features/auth_user/domain/entities/user.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> login(String username, String password) async {
    return await repository.login(username, password);
  }
}
