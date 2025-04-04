import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';

abstract class MyLocationsRepository {
  Stream<List<MyLocationsEntity>> getLocations();
  Future<void> addLocation({required MyLocationsEntity location});
  Future<void> updateLocation({required MyLocationsEntity location});
  Future<void> deleteLocation({required String id});
  Future<void> setDefaultLocation({required String id});
  Future<void> clearDefaultLocation();
}
