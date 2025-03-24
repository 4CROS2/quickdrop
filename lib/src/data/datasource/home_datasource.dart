import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';
import 'package:intl/intl.dart';

class HomeDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

      // Procesamos cada producto en paralelo para obtener sus ratings
      final List<Future<Map<String, dynamic>>> productsFutures =
          productsSnapshot.docs.map(
              (QueryDocumentSnapshot<Map<String, dynamic>> productDoc) async {
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
      };
    } catch (e) {
      // Registra el error según convenga
      return <String, dynamic>{
        'products': <dynamic>[],
        'sellers': <dynamic>[],
      };
    }
  }
}
