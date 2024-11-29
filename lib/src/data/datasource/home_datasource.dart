import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';

class HomeDatasource {
  HomeDatasource({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  Future<Map<String, dynamic>> getHomeData() async {
    try {
      CollectionReference<Object?> sellersCollection =
          _firestore.collection('sellers');

      final DateTime now = DateTime.now();
      final String currentDay = getDayString(now.weekday);
      final String currentTime = getFormattedTime(now);
      try {
        // Consulta para obtener los vendedores disponibles con base en el horario de hoy
        QuerySnapshot<Object?> sellersSnapshot = await sellersCollection
            .where('schedule.$currentDay.open_hour',
                isLessThanOrEqualTo: currentTime)
            .where('schedule.$currentDay.close_hour',
                isGreaterThanOrEqualTo: currentTime)
            .get();

        List<String> availableSellerIds = sellersSnapshot.toListString();
        if (availableSellerIds.isNotEmpty) {
          QuerySnapshot<Object?> productsQuery = await _firestore
              .collection('products')
              .where('seller_id', whereIn: availableSellerIds)
              .get();

          List<Map<String, dynamic>> products = productsQuery.toListMapJson();
          return <String, dynamic>{'products': products};
        } else {
          return <String, dynamic>{'products': <dynamic>[]};
        }
      } catch (e) {
        return <String, dynamic>{'products': <dynamic>[]};
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Función para obtener el día de la semana como string
  String getDayString(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'monday';
      case DateTime.tuesday:
        return 'tuesday';
      case DateTime.wednesday:
        return 'wednesday';
      case DateTime.thursday:
        return 'thursday';
      case DateTime.friday:
        return 'friday';
      case DateTime.saturday:
        return 'saturday';
      case DateTime.sunday:
        return 'sunday';
      default:
        return '';
    }
  }

  // Función para formatear la hora
  String getFormattedTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
//DateFormat.jm().format(yourTime)

//Record with named fields
//({String name, String lastName}) getName() => (name: 'John', lastName: 'Doe');
//final data = getName();
//
//  print(data.name);
//  print(data.lastName);
