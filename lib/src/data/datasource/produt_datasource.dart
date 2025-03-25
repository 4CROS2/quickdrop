import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductDetailDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _uid => _auth.currentUser!.uid;

  Future<Map<String, dynamic>> getProductData(
      {required String productId}) async {
    try {
      // 1. Obtener datos del producto principal
      DocumentReference<Object?> productRef =
          _firestore.collection('products').doc(productId);
      DocumentSnapshot<Object?> productSnapshot = await productRef.get();
      Map<String, dynamic> productData = productSnapshot.toJson();

      // Extraer `seller_id` y `tags` del producto
      final String sellerId = productData['seller_id'];
      final List<dynamic> tags = productData['tags'] ?? <dynamic>[];

      if (sellerId.isEmpty || tags.isEmpty) {
        throw Exception('El sellerId o los tags no están disponibles.');
      }

      // 2. Obtener datos del vendedor
      DocumentReference<Object?> sellerRef =
          _firestore.collection('sellers').doc(sellerId);
      DocumentSnapshot<Object?> sellerSnapshot = await sellerRef.get();
      Map<String, dynamic> sellerData = sellerSnapshot.toJson();
      productData['seller_data'] = sellerData;

      Query<Object?> productsQuery = _firestore
          .collection('products')
          .where('seller_id', isEqualTo: sellerId)
          .where('tags', arrayContainsAny: tags)
          .limit(20);

      QuerySnapshot<Object?> relatedProductsSnapshot =
          await productsQuery.get();
      List<Map<String, dynamic>> relatedProducts = relatedProductsSnapshot.docs
          .where(
            (QueryDocumentSnapshot<Object?> doc) => doc.id != productId,
          )
          .map(
            (QueryDocumentSnapshot<Object?> doc) => doc.toJson(),
          )
          .toList();
      productData['related_products'] = relatedProducts;

      return productData;
    } catch (e) {
      throw Exception('Error obteniendo datos del producto y vendedor: $e');
    }
  }

  Future<void> addToLastSeen({required String productId}) async {
    try {
      final DateTime dateTime = DateTime.now();

      final Map<String, dynamic> data = <String, dynamic>{
        'created_at': dateTime,
        'product_id': productId,
      };

      await _firestore
          .collection('users')
          .doc(_uid)
          .collection('lastseen')
          .doc()
          .set(data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
