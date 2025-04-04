import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/my_locations/domain/repository/my_locations_repository.dart';

class MyLocationsUsecase {
  MyLocationsUsecase({required MyLocationsRepository repository})
      : _repository = repository;
  final MyLocationsRepository _repository;

  Stream<List<MyLocationsEntity>> getLocations() {
    return _repository.getLocations();
  }

  Future<void> addLocation({required MyLocationsEntity location}) {
    return _repository.addLocation(
      location: location,
    );
  }

  Future<void> updateLocation({required MyLocationsEntity location}) {
    return _repository.updateLocation(
      location: location,
    );
  }

  Future<void> deleteLocation({required String id}) {
    return _repository.deleteLocation(
      id: id,
    );
  }

  Future<void> setDefaultLocation({required String id}) {
    return _repository.setDefaultLocation(
      id: id,
    );
  }

  Future<void> clearDefaultLocation() {
    return _repository.clearDefaultLocation();
  }
}
