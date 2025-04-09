import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/new_location/domain/repository/new_location_repository.dart';

class NewLocationUsecase {
  NewLocationUsecase({
    required NewLocationRepository repository,
  }) : _repository = repository;
  final NewLocationRepository _repository;

  Future<void> addNewLocation({required MyLocationsEntity location}) async {
    await _repository.addLocation(location: location);
  }
}
