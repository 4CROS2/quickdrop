import 'package:quickdrop/src/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login({
    required String email,
    required String password,
  });
  Future<UserEntity> signUp({
    required String name,
    required String lastName,
    required String phone,
    required String email,
    required String password,
  });
  Future<void> logout();
}
