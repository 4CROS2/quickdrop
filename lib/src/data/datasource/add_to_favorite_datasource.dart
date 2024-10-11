import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddToFavoriteDatasource {
  AddToFavoriteDatasource({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _firestore = firestore,
        _auth = auth;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  /// Método privado para obtener la referencia al documento de favoritos
  DocumentReference<Map<String, dynamic>> _favoriteDocRef(String productId) {
    final String? userId = _auth.currentUser?.uid;
    if (userId == null) {
      throw Exception('Usuario no autenticado');
    }

    return _firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(productId);
  }

  /// Verifica si el producto está en favoritos
  Future<Map<String, dynamic>> isFavorite({required String productId}) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> doc =
          await _favoriteDocRef(productId).get();
      return <String, dynamic>{
        'message': '',
        'state': doc.exists,
      };
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Añade el producto a los favoritos del usuario
  Future<Map<String, dynamic>> addToFavorite(
      {required String productId}) async {
    try {
      await _favoriteDocRef(productId).set(<String, dynamic>{
        'addedAt': FieldValue.serverTimestamp(), // Fecha de agregado
      });
      return <String, dynamic>{
        'message': 'producto agregado a tus favoritos',
        'state': true,
      };
    } catch (e) {
      return <String, dynamic>{
        'message': 'error al agregar a tus favoritos',
        'state': false
      };
    }
  }

  /// Elimina el producto de los favoritos del usuario
  Future<Map<String, dynamic>> removeFavorite(
      {required String productId}) async {
    try {
      await _favoriteDocRef(productId).delete();
      return <String, dynamic>{
        'message': 'producto removido de tus favoritos',
        'state': false,
      };
    } catch (e) {
      throw Exception(e);
      /*  return <String, dynamic>{
        'message':'error al remover de favoritos',
        'state': true,
      }; */
    }
  }
}
