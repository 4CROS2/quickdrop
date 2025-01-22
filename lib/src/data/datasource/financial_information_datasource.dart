import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';

class FinancialInformationDatasource {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _productsCollection =>
      _firestore.collection('products');

  CollectionReference<Map<String, dynamic>> get _sellersCollection =>
      _firestore.collection('sellers');

  Future<Map<String, dynamic>> verifyInformation({
    required String productId,
  }) async {
    // Obtener el documento del producto
    DocumentSnapshot<Map<String, dynamic>> productData =
        await _productsCollection.doc(productId).get();
    final Map<String, dynamic> product = productData.toJson();
    final String sellerId = productData.data()?['seller_id'];

    final DocumentSnapshot<Map<String, dynamic>> seller =
        await _sellersCollection.doc(sellerId).get();

    product['seller_data'] = seller.toJson();
    return product;
  }
}
