import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickdrop/src/data/datasource/firebase_auth_datasource.dart';
import 'package:quickdrop/src/data/model/user_model.dart';
import 'package:quickdrop/src/domain/repository/auth_repository.dart';

class IAuthRepository implements AuthRepository {
  IAuthRepository({
    required FirebaseLoginDatasource datasource,
  }) : _datasource = datasource;

  final FirebaseLoginDatasource _datasource;

  @override
  Stream<UserModel> userStatus() {
    final Stream<Map<String, dynamic>?> response = _datasource.userStatus();

    final Stream<UserModel> deliveryAgentStream =
        response.where((Map<String, dynamic>? data) => data != null).map(
              (Map<String, dynamic>? data) => UserModel.fromJson(
                json: data!,
              ),
            );
    return deliveryAgentStream;
  }

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final UserCredential userCredential = await _datasource.loginWithEmail(
      email: email,
      password: password,
    );
    return UserModel.fromFireBase(
      crendential: userCredential,
    );
  }

  @override
  Future<void> signUp({
    required String name,
    required String lastName,
    required String phone,
    required String email,
    required String password,
  }) async {
    await _datasource.signUpWithData(
      email: email,
      password: password,
      name: name,
      lastName: lastName,
      phone: phone,
    );
  }

  @override
  Future<void> logout() async {
    await _datasource.logout();
  }

  @override
  Future<void> googleSignin() async {
    await _datasource.signInWithGoogle();
  }

  @override
  Future<void> registerWithGoogle() async {
    await _datasource.registerWithGoogle();
  }
}
