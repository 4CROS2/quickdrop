import 'package:quickdrop/src/features/set_default_location/domain/repository/set_default_location_repository.dart';

class SetDefaultLocationUsecase {
  SetDefaultLocationUsecase({required SetDefaultLocationRepository repository})
      : _repository = repository;
  final SetDefaultLocationRepository _repository;

  Future<void> setDefaultLocation({required String locationId}) async {
    await _repository.setDefaultLocation(id: locationId);
  }
}
