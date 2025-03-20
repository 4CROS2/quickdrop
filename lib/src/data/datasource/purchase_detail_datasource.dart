import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PurchaceDetailDatasourceRepository {
  Stream<Map<String, dynamic>> getPurchaseDetail({
    required String orderId,
    required String sellerId,
  });
}

class PurchaseDetailDatasource implements PurchaceDetailDatasourceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<Map<String, dynamic>> getPurchaseDetail({
    required String orderId,
    required String sellerId,
  }) {
    final Stream<QuerySnapshot<Map<String, dynamic>>> response = _firestore
        .collection('sellers')
        .doc(sellerId)
        .collection('orders')
        .where('order_id', isEqualTo: orderId)
        .snapshots();
    return response.asMap();
  }
}

extension MapStreamExtension on Stream<QuerySnapshot<Map<String, dynamic>>> {
  Stream<Map<String, dynamic>> asMap() {
    return map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.data();
      } else {
        throw Exception('No se encontró información.');
      }
    });
  }
}
