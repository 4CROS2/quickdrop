import 'package:quickdrop/src/features/my_locations/data/model/my_location_model.dart';

abstract class MyLocationsDataSourceRepository {
  Stream<List<Map<String, dynamic>>> getLocations();
  Future<void> addLocation({required MyLocationsModel location});
  Future<void> updateLocation({required MyLocationsModel location});
  Future<void> deleteLocation({required String id});
  Future<void> setDefaultLocation({required String id});
  Future<void> clearDefaultLocation();
}
