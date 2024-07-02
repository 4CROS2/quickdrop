import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickdrop/src/data/model/user_model.dart';

class FirebaseLoginDatasource {
  FirebaseLoginDatasource({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

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

  Future<UserModel> signUpWithData({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String phone,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Guardar información adicional en Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set(
        <String, String>{
          'name': name,
          'lastName': lastName,
          'phone': phone,
          'email': email,
        },
      );

      return UserModel.fromFireBase(
        crendential: userCredential,
      );
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case 'email-already-in-use':
          throw 'El correo electrónico ya está en uso';
        case 'invalid-email':
          throw 'El correo electrónico es inválido';
        case 'operation-not-allowed':
          throw 'La operación no está permitida';
        case 'weak-password':
          throw 'La contraseña es demasiado débil';
        default:
          throw 'Error desconocido';
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
