import 'package:quickdrop/src/features/my_locations/data/model/my_location_model.dart';

abstract class NewLocationDatasourceRepository {
  Future<void> addLocation({
    required MyLocationsModel location,
  });
}
