import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class HomeDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _uid => _auth.currentUser!.uid;

  Future<Map<String, dynamic>> getHomeData() async {
    final DateTime now = DateTime.now();
    final String currentDay = DateFormat('EEEE').format(now).toLowerCase();
    final String currentTime = DateFormat('HH:mm').format(now);

    try {
      // Consulta para obtener vendedores disponibles según el horario actual
      final QuerySnapshot<Map<String, dynamic>> sellersSnapshot =
          await _firestore
              .collection('sellers')
              .where(
                'schedule.$currentDay.open_hour',
                isLessThanOrEqualTo: currentTime,
              )
              .where(
                'schedule.$currentDay.close_hour',
                isGreaterThanOrEqualTo: currentTime,
              )
              .get();

      final List<String> availableSellerIds = sellersSnapshot.toListString();

      if (availableSellerIds.isEmpty) {
        throw Exception('empty');
      }

      // Consulta para obtener los productos de los vendedores disponibles
      final QuerySnapshot<Map<String, dynamic>> productsSnapshot =
          await _firestore
              .collection('products')
              .where('seller_id', whereIn: availableSellerIds)
              .get();

      // Obtener los últimos 4 productos vistos
      final QuerySnapshot<Map<String, dynamic>> lastSeen = await _firestore
          .collection('users')
          .doc(_uid)
          .collection('lastseen')
          .orderBy('created_at', descending: true)
          .limit(4)
          .get();

      // Extraer los product_id de lastSeen
      final List<String> lastSeenProductIds = lastSeen.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
              doc.data()['product_id'] as String)
          .toList();

      // Procesamos cada producto en paralelo para obtener sus ratings y filtrar
      final List<Future<Map<String, dynamic>>> productsFutures =
          productsSnapshot.docs
              .where((QueryDocumentSnapshot<Map<String, dynamic>> productDoc) =>
                  !lastSeenProductIds.contains(productDoc.id))
              .map((QueryDocumentSnapshot<Map<String, dynamic>>
                  productDoc) async {
        Map<String, dynamic> productData = productDoc.data();
        productData['id'] = productDoc.id;
        // Consulta la subcolección "ratings" del producto actual
        final QuerySnapshot<Map<String, dynamic>> ratingsSnapshot =
            await productDoc.reference.collection('ratings').get();

        // Convierte cada documento de rating a un Map
        List<Map<String, dynamic>> ratingsList =
            ratingsSnapshot.toListMapJson();

        // Agrega la lista de ratings al mapa del producto
        productData['ratings'] = ratingsList;

        return productData;
      }).toList();

      // Espera todas las consultas de ratings en paralelo
      final List<Map<String, dynamic>> productsWithRatings =
          await Future.wait(productsFutures);

      // Consulta para obtener todos los vendedores
      final QuerySnapshot<Map<String, dynamic>> sellers =
          await _firestore.collection('sellers').get();

      return <String, dynamic>{
        'products': productsWithRatings,
        'sellers': sellers.toListMapJson(),
        'last_seen': lastSeen.toListMapJson()
      };
    } catch (e) {
      // Registra el error según convenga
      return <String, dynamic>{
        'products': <dynamic>[],
        'sellers': <dynamic>[],
        'last_seen': <dynamic>[]
      };
    }
  }
}
