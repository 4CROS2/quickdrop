import 'package:quickdrop/src/features/current_location_button/domain/entity/current_location_entity.dart';
import 'package:quickdrop/src/features/current_location_button/domain/repository/current_location_repository.dart';

class CurrentLocationUsecase {
  CurrentLocationUsecase({
    required CurrentLocationRepository repository,
  }) : _repository = repository;
  final CurrentLocationRepository _repository;

  Stream<CurrentLocationEntity> get getCurrentLocation =>
      _repository.getCurrentLocation();
}
