import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';

abstract class NewLocationRepository {
  Future<void> addLocation({
    required MyLocationsEntity location,
  });
}
