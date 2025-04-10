import 'package:quickdrop/src/features/current_location_button/domain/entity/current_location_entity.dart';

abstract class CurrentLocationRepository {
  Stream<CurrentLocationEntity> getCurrentLocation();
}
