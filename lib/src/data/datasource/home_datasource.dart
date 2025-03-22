import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';

class HomeDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getHomeData() async {
    final DateTime now = DateTime.now();
    final String currentDay = _getDayString(now.weekday);
    final String currentTime = _getFormattedTime(now);

    try {
      // Consulta para obtener vendedores disponibles según el horario actual
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
        return <String, dynamic>{
          'products': <dynamic>[],
          'sellers': <dynamic>[],
        };
      }

      final QuerySnapshot<Map<String, dynamic>> productsSnapshot =
          await _firestore
              .collection('products')
              .where('seller_id', whereIn: availableSellerIds)
              .get();

      final QuerySnapshot<Map<String, dynamic>> sellers =
          await _firestore.collection('sellers').get();

      return <String, dynamic>{
        'products': productsSnapshot.toListMapJson(),
        'sellers': sellers.toListMapJson()
      };
    } catch (e) {
      // Se puede registrar el error aquí según convenga
      return <String, dynamic>{
        'products': <dynamic>[],
        'sellers': <dynamic>[],
      };
    }
  }

  // Función privada para obtener el nombre del día a partir del número del día
  String _getDayString(int weekday) {
    const Map<int, String> days = <int, String>{
      DateTime.monday: 'monday',
      DateTime.tuesday: 'tuesday',
      DateTime.wednesday: 'wednesday',
      DateTime.thursday: 'thursday',
      DateTime.friday: 'friday',
      DateTime.saturday: 'saturday',
      DateTime.sunday: 'sunday',
    };
    return days[weekday] ?? '';
  }

  // Función privada para formatear la hora en 'HH:mm'
  String _getFormattedTime(DateTime time) =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}
