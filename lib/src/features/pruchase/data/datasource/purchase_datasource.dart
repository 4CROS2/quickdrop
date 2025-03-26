import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickdrop/src/data/model/purchase_model.dart';

class PurchaseDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Saves an order to Firestore.
  ///
  /// Takes a [PurchaseModel] as a required parameter.
  /// Returns the document ID of the saved order.
  /// Throws an exception if there is an error during the save operation.
  Future<String> saveOrder({required PurchaseModel purchase}) async {
    try {
      // Reference to the seller's orders collection
      final DocumentReference<Map<String, dynamic>> sellerRef = _firestore
          .collection('sellers')
          .doc(purchase.sellerId)
          .collection('orders')
          .doc();

      // Convert purchase model to JSON
      final Map<String, dynamic> orderData = purchase.toJson();

      // Save the order data to Firestore
      await sellerRef.set(orderData);

      return sellerRef.id;
    } catch (e) {
      throw Exception('Error saving the order: $e');
    }
  }
}
