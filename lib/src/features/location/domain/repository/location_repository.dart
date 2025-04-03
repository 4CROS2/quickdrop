import 'package:quickdrop/src/features/location/domain/entity/location_entity.dart';

abstract class LocationRepository {
  Future<LocationEntity> getCurrentLocation();
}
