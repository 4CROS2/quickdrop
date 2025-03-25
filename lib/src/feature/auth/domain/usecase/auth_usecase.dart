import 'package:quickdrop/src/feature/auth/domain/entity/user_entity.dart';
import 'package:quickdrop/src/feature/auth/domain/repository/auth_repository.dart';

class AuthUseCase {
  AuthUseCase({
    required AuthRepository repository,
  }) : _repository = repository;
  final AuthRepository _repository;

  Stream<UserEntity> userStatus() {
    final Stream<UserEntity> data = _repository.userStatus();
    return data;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _repository.login(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String phone,
  }) async {
    await _repository.signUp(
      name: name,
      lastName: lastName,
      phone: phone,
      email: email,
      password: password,
    );
  }

  Future<void> googleSignin() async {
    await _repository.googleSignin();
  }

  Future<void> registerWithGoogle() async {
    await _repository.registerWithGoogle();
  }

  Future<void> logout() async {
    return await _repository.logout();
  }
}
