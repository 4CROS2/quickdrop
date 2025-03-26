import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyPurchasesDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _uid => _auth.currentUser!.uid;

  Stream<List<Map<String, dynamic>>> getMyPurchases() {
    try {
      final Stream<List<Map<String, dynamic>>> querySnapshot = _firestore
          .collectionGroup('orders')
          .where('buyer_id', isEqualTo: _uid)
          .orderBy('created_at', descending: true)
          .snapshots()
          .toMapJsonListStream();

      return querySnapshot;
    } catch (e) {
      throw Exception(e);
    }
  }
}
