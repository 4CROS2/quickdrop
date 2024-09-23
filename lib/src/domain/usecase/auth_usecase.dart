import 'package:quickdrop/src/domain/entity/user_entity.dart';
import 'package:quickdrop/src/domain/repository/auth_repository.dart';

class AuthUseCase {
  AuthUseCase({
    required AuthRepository repository,
  }) : _repository = repository;
  final AuthRepository _repository;

  Future<UserEntity> login(
      {required String email, required String password}) async {
    return await _repository.login(
      email: email,
      password: password,
    );
  }

  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String phone,
  }) async {
    return await _repository.signUp(
      name: name,
      lastName: lastName,
      phone: phone,
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    return await _repository.logout();
  }
}
