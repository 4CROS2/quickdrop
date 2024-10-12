import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickdrop/src/core/extensions/querysnapshot_to_json_extension.dart';

class AddToFavoriteDatasource {
  AddToFavoriteDatasource({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _firestore = firestore,
        _auth = auth {
    if (_auth.currentUser == null) {
      throw Exception('Usuario no autenticado');
    }
  }
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
    } on FirebaseAuthException catch (e) {
      throw Exception('Error de autenticación: ${e.message}');
    } on FirebaseException catch (e) {
      throw Exception('Error de Firestore: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado: $e');
    }
  }

  /// Añade el producto a los favoritos del usuario
  Future<Map<String, dynamic>> addToFavorite(
      {required String productId}) async {
    try {
      await _favoriteDocRef(productId).set(<String, dynamic>{
        'addedAt': FieldValue.serverTimestamp(),
      });
      return <String, dynamic>{
        'message': 'producto agregado a tus favoritos',
        'state': true,
      };
    } catch (e) {
      throw Exception(e);
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
    }
  }

  Future<Map<String, dynamic>> getFavoriteProducts() async {
    try {
      final String? userId = _auth.currentUser?.uid;
      if (userId == null) {
        throw Exception('Usuario no autenticado');
      }

      // Obtener los favoritos del usuario logueado
      final QuerySnapshot<Map<String, dynamic>> favoritesSnapshot =
          await _firestore
              .collection('users')
              .doc(userId)
              .collection('favorites')
              .get();

      final List<String> favoriteProductIds = favoritesSnapshot.toListString();

      if (favoriteProductIds.isEmpty) {
        return <String, dynamic>{
          'favorites': <dynamic>[],
        };
      }

      // Obtener los productos favoritos
      final QuerySnapshot<Map<String, dynamic>> productsSnapshot =
          await _firestore
              .collection('products')
              .where(
                FieldPath.documentId,
                whereIn: favoriteProductIds,
              )
              .get();

      // Usar la extensión toListMapJson para convertir los documentos a una lista de Map<String, dynamic>
      final List<Map<String, dynamic>> favorites =
          productsSnapshot.toListMapJson();

      return <String, dynamic>{
        'favorites': favorites,
      };
    } catch (e) {
      throw Exception('Error al obtener los productos favoritos: $e');
    }
  }
}
