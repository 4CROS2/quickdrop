import 'package:latlong2/latlong.dart';
import 'package:quickdrop/src/features/location/domain/entity/location_entity.dart';

abstract class LocationRepository {
  Future<LocationEntity> getCurrentLocation();
  Future<String> getAddress({required LatLng position});
}
