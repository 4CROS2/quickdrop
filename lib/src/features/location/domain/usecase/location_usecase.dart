import 'package:quickdrop/src/features/location/domain/entity/location_entity.dart';
import 'package:quickdrop/src/features/location/domain/repository/location_repository.dart';

class LocationUsecase {
  LocationUsecase({
    required LocationRepository repository,
  }) : _repository = repository;

  final LocationRepository _repository;

  Future<LocationEntity> getCurrentLocation() async {
    return await _repository.getCurrentLocation();
  }
}
