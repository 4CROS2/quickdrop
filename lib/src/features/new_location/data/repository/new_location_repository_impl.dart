import 'package:quickdrop/src/features/my_locations/data/model/my_location_model.dart';
import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/new_location/domain/repository/new_location_datasource_repository.dart';
import 'package:quickdrop/src/features/new_location/domain/repository/new_location_repository.dart';

class INewLocationRepository implements NewLocationRepository {
  INewLocationRepository({
    required NewLocationDatasourceRepository datasource,
  }) : _datasource = datasource;
  final NewLocationDatasourceRepository _datasource;

  @override
  Future<void> addLocation({required MyLocationsEntity location}) async {
    final MyLocationsModel locationModel = MyLocationsModel.fromEntity(
      entity: location,
    );

    await _datasource.addLocation(location: locationModel);
  }
}
