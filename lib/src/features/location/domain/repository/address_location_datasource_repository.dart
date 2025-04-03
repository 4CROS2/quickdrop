import 'package:latlong2/latlong.dart';

abstract class AddressLocationRepository {
  Future<String> getCurrentAddress({required LatLng location});
}
