import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickdrop/src/core/extensions/document_snapshot_stream_extension.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseLoginDatasource {
  FirebaseLoginDatasource({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
    required GoogleSignIn googleSigin,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore,
        _googleSignIn = googleSigin;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  Stream<Map<String, dynamic>?> deliveryStatus() {
    return _firebaseAuth.userChanges().switchMap((User? user) {
      if (user != null) {
        return _firestore
            .collection('users')
            .doc(user.uid)
            .snapshots()
            .toMapJsonStream();
      } else {
        return Stream<Map<String, dynamic>>.value(<String, dynamic>{});
      }
    });
  }

  Future<UserCredential> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (exception) {
      final String errorCode = _mapFirebaseAuthExceptionToErrorCode(exception);
      throw errorCode;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signUpWithData({
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

      await _firestore.collection('users').doc(userCredential.user?.uid).set(
        <String, String>{
          'name': name,
          'lastName': lastName,
          'phone': phone,
          'email': email,
        },
      );
    } on FirebaseAuthException catch (exception) {
      final String errorMessage = _mapFirebaseAuthExceptionToMessage(exception);
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw '505';
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final DocumentSnapshot<Map<String, dynamic>> userDoc = await _firestore
          .collection('deliveryAgents')
          .doc(googleUser.id)
          .get();

      if (!userDoc.exists) {
        await logout();
        throw '505';
      }

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      await _firestore.collection('users').doc(userCredential.user?.uid).set(
        <String, dynamic>{
          'name': googleUser.displayName,
          'email': googleUser.email,
          'photoUrl': googleUser.photoUrl,
          'phone': '',
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  // Función para mapear códigos de FirebaseAuthException a códigos de error personalizados
  String _mapFirebaseAuthExceptionToErrorCode(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-credential':
        return '500';
      case 'invalid-email':
        return '501';
      case 'user-disabled':
        return '502';
      case 'user-not-found':
        return '503';
      case 'wrong-password':
        return '504';
      default:
        return '505';
    }
  }

  // Función para mapear códigos de FirebaseAuthException a mensajes personalizados
  String _mapFirebaseAuthExceptionToMessage(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'email-already-in-use':
        return 'El correo electrónico ya está en uso.';
      case 'invalid-email':
        return 'El correo electrónico no es válido.';
      case 'operation-not-allowed':
        return 'Operación no permitida.';
      case 'weak-password':
        return 'La contraseña es demasiado débil.';
      default:
        return 'Ocurrió un error desconocido.';
    }
  }
}
