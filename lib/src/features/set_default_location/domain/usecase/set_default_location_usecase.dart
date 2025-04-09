import 'package:quickdrop/src/features/my_locations/domain/repository/my_locations_repository.dart';

class SetDefaultLocationUsecase {
  SetDefaultLocationUsecase({required MyLocationRepository repository})
      : _repository = repository;
  final MyLocationRepository _repository;

  Future<void> setDefaultLocation({required String locationId}) async {
    await _repository.setDefaultLocation(id: locationId);
  }
}
