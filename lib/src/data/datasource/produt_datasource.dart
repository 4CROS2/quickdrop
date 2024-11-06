import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickdrop/src/core/extensions/document_snapshot_extension.dart';

class ProductDetailDatasource {
  Future<Map<String, dynamic>> getProductData(
      {required String productId}) async {
    try {
      DocumentReference<Object?> productRef =
          FirebaseFirestore.instance.collection('products').doc(productId);
      DocumentSnapshot<Object?> snapshot = await productRef.get();
      return snapshot.toJson();
    } catch (e) {
      throw Exception(e);
    }
  }
}
