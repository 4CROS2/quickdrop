import 'package:quickdrop/src/features/current_location_button/data/model/current_location_model.dart';
import 'package:quickdrop/src/features/current_location_button/domain/repository/current_locatio_datasource_repository.dart';
import 'package:quickdrop/src/features/current_location_button/domain/repository/current_location_repository.dart';

class ICurrentLocationRepository implements CurrentLocationRepository {
  ICurrentLocationRepository({
    required CurrentLocatioDatasourceRepository datasource,
  }) : _datasource = datasource;

  final CurrentLocatioDatasourceRepository _datasource;
  @override
  Stream<CurrentLocationModel> getCurrentLocation() {
    try {
      return _datasource
          .getCurrentLocation()
          .map((Map<String, dynamic> location) {
        return CurrentLocationModel.fromJson(
          json: location,
        );
      });
    } catch (e) {
      throw 'error de datos';
    }
  }
}
