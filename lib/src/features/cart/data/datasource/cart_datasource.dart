import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickdrop/src/features/cart/domain/repository/cart_datasource_repository.dart';
import 'package:rxdart/rxdart.dart';

class ICartDatasource implements CartDatasourceRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? get _uid => _auth.currentUser?.uid;

  @override
  Stream<List<Map<String, dynamic>>> getCartProducts() {
    try {
      final Stream<List<Map<String, dynamic>>> cartList = _firestore
          .collection('users')
          .doc(_uid)
          .collection('cart')
          .snapshots()
          .toMapJsonListStream();

      // 3) Para cada emisión (lista de maps) mapeamos a streams de detalles + datos de carrito:
      return cartList.switchMap(
        (List<Map<String, dynamic>> cartItems) {
          if (cartItems.isEmpty) {
            return Stream<List<Map<String, dynamic>>>.value(
              <Map<String, dynamic>>[],
            );
          }

          final List<Stream<Map<String, dynamic>>> itemStreams = cartItems.map(
            (Map<String, dynamic> cart) {
              final String productId = cart['product_id'] as String;

              // Stream<Map> del producto con su 'id', gracias a tu extensión:
              return _firestore
                  .collection('products')
                  .doc(productId)
                  .snapshots()
                  .toMapJsonStream()
                  // 4) Combina datos de carrito + producto:
                  .map(
                    (Map<String, dynamic> prod) => <String, dynamic>{
                      ...prod,
                      'id': cart['id'],
                      'product_id': productId,
                      'quantity': cart['quantity'],
                      'createdAt': (cart['createdAt'] as Timestamp).toDate(),
                      'modifiedAt': (cart['modifiedAt'] as Timestamp).toDate(),
                    },
                  );
            },
          ).toList();

          // 5) Emitimos la lista completa cuando cualquiera cambie:
          return CombineLatestStream.list(itemStreams);
        },
      );
    } catch (e) {
      throw Exception(
        'error obteniendo los datos',
      );
    }
  }
}
