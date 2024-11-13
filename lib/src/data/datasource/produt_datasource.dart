import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickdrop/src/core/extensions/document_snapshot_extension.dart';

class ProductDetailDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

      // 3. Buscar productos del mismo vendedor con tags coincidentes
      Query<Object?> productsQuery = _firestore
          .collection('products')
          .where('seller_id', isEqualTo: sellerId)
          .where('tags', arrayContainsAny: tags)
          .limit(20);
      // Limitar el número de resultados para evitar muchas coincidencias

      QuerySnapshot<Object?> relatedProductsSnapshot =
          await productsQuery.get();
      List<Map<String, dynamic>> relatedProducts = relatedProductsSnapshot.docs
          .where((QueryDocumentSnapshot<Object?> doc) =>
              doc.id != productId) // Excluir el producto principal
          .map((QueryDocumentSnapshot<Object?> doc) => doc.toJson())
          .toList();

      // 4. Agregar los productos relacionados al resultado final
      productData['related_products'] = relatedProducts;

      return productData;
    } catch (e) {
      throw Exception('Error obteniendo datos del producto y vendedor: $e');
    }
  }
}
