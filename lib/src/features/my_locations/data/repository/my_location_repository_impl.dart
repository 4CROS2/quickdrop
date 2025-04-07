import 'package:quickdrop/src/features/my_locations/data/model/my_location_model.dart';
import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/my_locations/domain/repository/my_location_datasource_repository.dart';
import 'package:quickdrop/src/features/my_locations/domain/repository/my_locations_repository.dart';

class IMyLocationsRepository implements MyLocationRepository {
  IMyLocationsRepository({
    required MyLocationsDataSourceRepository datasource,
  }) : _datasource = datasource;
  final MyLocationsDataSourceRepository _datasource;

  @override
  Future<void> addLocation({required MyLocationsEntity location}) async {
    final MyLocationsModel locationModel = MyLocationsModel.fromEntity(
      entity: location,
    );

    await _datasource.addLocation(location: locationModel);
  }

  @override
  Future<void> clearDefaultLocation() async {
    await _datasource.clearDefaultLocation();
  }

  @override
  Future<void> deleteLocation({required String id}) async {
    await _datasource.deleteLocation(id: id);
  }

  @override
  Stream<List<MyLocationsModel>> getLocations() {
    final Stream<List<Map<String, dynamic>>> locations =
        _datasource.getLocations();

    return locations.map((List<Map<String, dynamic>> list) => list
        .map((Map<String, dynamic> map) => MyLocationsModel.fromJson(map))
        .toList());
  }

  @override
  Future<void> setDefaultLocation({required String id}) async {
    await _datasource.setDefaultLocation(id: id);
  }

  @override
  Future<void> updateLocation({required MyLocationsEntity location}) async {
    final MyLocationsModel locationModel = MyLocationsModel.fromEntity(
      entity: location,
    );

    await _datasource.updateLocation(location: locationModel);
  }
}
