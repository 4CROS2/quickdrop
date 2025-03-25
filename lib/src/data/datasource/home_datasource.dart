import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

// Interfaz sellada para HomeDatasource
sealed class HomeDatasource {
  Future<Map<String, dynamic>> getHomeData();
}

// Implementación concreta de HomeDatasource
class IHomeDatasource implements HomeDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _uid => _auth.currentUser!.uid;

  @override
  Future<Map<String, dynamic>> getHomeData() async {
    final DateTime now = DateTime.now();
    final String currentDay = DateFormat('EEEE').format(now).toLowerCase();
    final String currentTime = DateFormat('HH:mm').format(now);

    try {
      // Consultar vendedores disponibles
      final QuerySnapshot<Map<String, dynamic>> sellersSnapshot =
          await _firestore
              .collection('sellers')
              .where('schedule.$currentDay.open_hour',
                  isLessThanOrEqualTo: currentTime)
              .where('schedule.$currentDay.close_hour',
                  isGreaterThanOrEqualTo: currentTime)
              .get();

      final List<String> availableSellerIds = sellersSnapshot.toListString();
      if (availableSellerIds.isEmpty) {
        throw Exception('No hay vendedores disponibles');
      }

      // Consultar productos y todos los vendedores en paralelo
      final Future<QuerySnapshot<Map<String, dynamic>>> productsFuture =
          _firestore
              .collection('products')
              .where(
                'seller_id',
                whereIn: availableSellerIds,
              )
              .get();
      final Future<QuerySnapshot<Map<String, dynamic>>> allSellersFuture =
          _firestore.collection('sellers').get();

      // Consultar últimos productos vistos
      final QuerySnapshot<Map<String, dynamic>> lastSeen = await _firestore
          .collection('users')
          .doc(_uid)
          .collection('lastseen')
          .orderBy(
            'created_at',
            descending: true,
          )
          .limit(4)
          .get();

      // Procesar IDs de últimos vistos
      final Set<String> uniqueProductIds = <String>{};
      final List<String> lastSeenProductIds = lastSeen.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
              doc.data()['product_id'] as String)
          .where((String id) => uniqueProductIds.add(id))
          .toList();

      // Esperar resultados de consultas paralelas
      final QuerySnapshot<Map<String, dynamic>> productsSnapshot =
          await productsFuture;
      final QuerySnapshot<Map<String, dynamic>> allSellers =
          await allSellersFuture;

      // Crear mapa de productos disponibles
      final Map<String, QueryDocumentSnapshot<Map<String, dynamic>>>
          productMap = <String, QueryDocumentSnapshot<Map<String, dynamic>>>{
        for (QueryDocumentSnapshot<Map<String, dynamic>> doc
            in productsSnapshot.docs)
          doc.id: doc,
      };

      // Procesar productos vistos recientemente
      final List<Future<Object>> lastSeenFutures =
          lastSeenProductIds.map((String productId) async {
        final QueryDocumentSnapshot<Map<String, dynamic>>? productDoc =
            productMap[productId];
        if (productDoc != null) {
          return _processProductWithRatings(productDoc);
        }
        // Si no está en los disponibles, consultar directamente
        final DocumentSnapshot<Map<String, dynamic>> doc =
            await _firestore.collection('products').doc(productId).get();
        return doc.exists
            ? _processProductWithRatings(doc)
            : <String, String>{
                'id': productId,
                'error': 'Producto no encontrado'
              };
      }).toList();

      // Procesar productos restantes
      final List<Future<Map<String, dynamic>>> remainingProducts =
          productsSnapshot.docs
              .where((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                  !lastSeenProductIds.contains(doc.id))
              .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                  _processProductWithRatings(doc))
              .toList();

      // Esperar todas las promesas
      final List<Map<String, dynamic>> productsWithRatings =
          await Future.wait(remainingProducts);
      final List<Object> lastSeenProducts = await Future.wait(lastSeenFutures);

      // Combinar productos y eliminar duplicados
      final Map<String, Map<String, dynamic>> combinedProducts =
          <String, Map<String, dynamic>>{};
      for (final Map<String, dynamic> product in productsWithRatings) {
        combinedProducts[product['id']] = product;
      }
      for (final Map<String, dynamic> product
          in lastSeenProducts.whereType<Map<String, dynamic>>()) {
        combinedProducts[product['id']] = product;
      }

      // Convertir a lista
      final List<Map<String, dynamic>> allProducts =
          combinedProducts.values.toList();

      // Verificar si hay menos de 4 productos
      final bool hasFewProducts = allProducts.length < 4;

      return <String, dynamic>{
        'products': allProducts.take(10).toList(), // Limitar a 10 productos
        'sellers': allSellers.toListMapJson(),
        'last_seen':
            hasFewProducts ? <Map<String, dynamic>>[] : lastSeenProducts,
      };
    } catch (e) {
      return <String, dynamic>{
        'products': <dynamic>[],
        'sellers': <dynamic>[],
        'last_seen': <dynamic>[],
        'error': e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> _processProductWithRatings(
      DocumentSnapshot<Map<String, dynamic>> productDoc) async {
    final Map<String, dynamic> data = productDoc.data()!
      ..['id'] = productDoc.id;
    final QuerySnapshot<Map<String, dynamic>> ratingsSnapshot =
        await productDoc.reference.collection('ratings').get();
    data['ratings'] = ratingsSnapshot.toListMapJson();
    return data;
  }
}
