import 'package:quickdrop/src/data/datasource/firebase_login_datasource.dart';
import 'package:quickdrop/src/data/model/user_model.dart';
import 'package:quickdrop/src/domain/entity/user_entity.dart';
import 'package:quickdrop/src/domain/repository/auth_repository.dart';

class IAuthRepository implements AuthRepository {
  IAuthRepository({
    required FirebaseLoginDatasource datasource,
  }) : _datasource = datasource;

  final FirebaseLoginDatasource _datasource;

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final UserModel userModel = await _datasource.loginWithEmail(
      email: email,
      password: password,
    );
    return userModel;
  }

  @override
  Future<UserEntity> signUp({
    required String name,
    required String lastName,
    required String phone,
    required String email,
    required String password,
  }) async {
    final UserModel userModel = await _datasource.signUpWithData(
      email: email,
      password: password,
      name: name,
      lastName: lastName,
      phone: phone,
    );
    return userModel;
  }

  @override
  Future<void> logout() async {
    await _datasource.logout();
  }
}
