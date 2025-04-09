import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/my_locations/domain/repository/my_locations_repository.dart';

class NewLocationUsecase {
  NewLocationUsecase({
    required MyLocationRepository repository,
  }) : _repository = repository;
  final MyLocationRepository _repository;

  Future<void> addNewLocation({required MyLocationsEntity location}) async {
    await _repository.addLocation(location: location);
  }
}
