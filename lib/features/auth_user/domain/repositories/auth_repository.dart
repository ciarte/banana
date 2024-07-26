import 'package:banana/features/auth_user/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String username, String password);
}
