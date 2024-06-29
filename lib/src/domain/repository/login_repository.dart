import 'package:quickdrop/src/domain/entity/user_entity.dart';

abstract class LoginRepository {
  Future<UserEntity> login({
    required String email,
    required String password,
  });
  Future<void> logout();
}
