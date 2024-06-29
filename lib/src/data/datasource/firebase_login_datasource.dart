import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickdrop/src/data/model/user_model.dart';

class FirebaseLoginDatasource {
  final FirebaseAuth _firebaseAuth;
  FirebaseLoginDatasource({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  Future<UserModel> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFireBase(crendential: userCredential);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
