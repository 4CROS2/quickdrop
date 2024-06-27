import 'package:quickdrop/src/data/datasource/firebase_login_datasource.dart';
import 'package:quickdrop/src/data/model/user_model.dart';
import 'package:quickdrop/src/domain/repository/login_repository.dart';

class ILoginRepository implements LoginRepository {
  ILoginRepository({
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
  Future<void> logout() async {
    await _datasource.logout();
  }
}
