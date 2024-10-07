import 'package:cloud_firestore/cloud_firestore.dart';

class HomeDatasource {
  HomeDatasource({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  Future<Map<String, dynamic>> getHomeData() async {
    CollectionReference<Object?> collection = _firestore.collection('products');
    QuerySnapshot<Object?> querySnapshot = await collection.get();

    List<Map<String, dynamic>> products = <Map<String, dynamic>>[];

    // Iterar sobre los documentos y agregar el id del documento
    for (QueryDocumentSnapshot<Object?> doc in querySnapshot.docs) {
      Map<String, dynamic> productData = doc.data() as Map<String, dynamic>;

      // Agregar el 'id' del documento a los datos del producto
      productData['id'] = doc.id;

      products.add(productData);
    }
    // Devolver un Map que contenga la lista de productos
    return <String, dynamic>{'products': products};
  }
}
