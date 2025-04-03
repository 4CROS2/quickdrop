import 'package:latlong2/latlong.dart';

abstract class LocationDatasourceRepository {
  Future<LatLng> getCurrentLocation();
}
