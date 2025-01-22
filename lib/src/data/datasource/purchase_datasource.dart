import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickdrop/src/data/model/purchase_model.dart';

class PurchaseDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Guarda un pedido en Firestore bajo `sellers/{seller_id}/orders`.
  Future<void> saveOrder({required PurchaseModel purchase}) async {
    try {
      // Referencia a la colección de órdenes del vendedor.
      final DocumentReference<Map<String, dynamic>> sellerRef = _firestore
          .collection('sellers')
          .doc(purchase.sellerId)
          .collection('orders')
          .doc();

      // Datos del pedido a guardar.
      final Map<String, dynamic> orderData = purchase.toJson();

      // Guardar el pedido en Firestore.
      await sellerRef.set(orderData);
    } catch (e) {
      throw Exception('Error al guardar el pedido: $e');
    }
  }
}
