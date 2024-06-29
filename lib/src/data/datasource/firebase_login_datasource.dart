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
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case 'invalid-email':
          throw 'el correo ingresado es invalido';
        case 'user-disabled':
          throw 'el usuario ha sido desabilitado';
        case 'user-not-found':
          throw 'usuario no encontrado';
        case 'wrong-password':
          throw 'contraseña incorrecta';
        default:
          throw 'error desconocido';
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
