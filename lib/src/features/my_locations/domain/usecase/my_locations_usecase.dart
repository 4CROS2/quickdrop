import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/my_locations/domain/repository/my_locations_repository.dart';

class MyLocationsUsecase {
  MyLocationsUsecase({required MyLocationRepository repository})
      : _repository = repository;
  final MyLocationRepository _repository;

  Stream<List<MyLocationsEntity>> getLocations() {
    return _repository.getLocations();
  }

  Future<void> deleteLocation({required String id}) {
    return _repository.deleteLocation(
      id: id,
    );
  }

  Future<void> clearDefaultLocation() {
    return _repository.clearDefaultLocation();
  }
}
