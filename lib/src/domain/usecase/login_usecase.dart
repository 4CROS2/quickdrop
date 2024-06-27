import 'package:quickdrop/src/domain/entity/user_entity.dart';
import 'package:quickdrop/src/domain/repository/login_repository.dart';

class LoginUseCase {
  LoginUseCase({
    required LoginRepository repository,
  }) : _repository = repository;
  final LoginRepository _repository;

  Future<UserEntity> login(
      {required String email, required String password}) async {
    return await _repository.login(
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    return await _repository.logout();
  }
}
