import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

abstract class AddressLocationDatasourceRepository {
  Future<Placemark> getCurrentAddress({required LatLng location});
}
