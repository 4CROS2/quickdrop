import 'package:quickdrop/src/features/set_default_location/domain/repository/set_default_location_datasource_repositoy.dart';
import 'package:quickdrop/src/features/set_default_location/domain/repository/set_default_location_repository.dart';

class ISetDefaultLocationRepository implements SetDefaultLocationRepository {
  ISetDefaultLocationRepository({
    required SetDefaultLocationDatasourceRepositoy datasource,
  }) : _datasource = datasource;

  final SetDefaultLocationDatasourceRepositoy _datasource;

  @override
  Future<void> setDefaultLocation({required String id}) async {
    await _datasource.setDefaultLocation(id: id);
  }
}
