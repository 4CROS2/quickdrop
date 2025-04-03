import 'package:latlong2/latlong.dart';
import 'package:quickdrop/src/features/location/data/model/location_model.dart';
import 'package:quickdrop/src/features/location/domain/repository/address_location_datasource_repository.dart';
import 'package:quickdrop/src/features/location/domain/repository/location_datasource_repository.dart';
import 'package:quickdrop/src/features/location/domain/repository/location_repository.dart';

class ILocationRespository extends LocationRepository {
  ILocationRespository({
    required LocationDatasourceRepository locationDatasource,
    required AddressLocationRepository addressDatasource,
  })  : _locationDatasource = locationDatasource,
        _addressDatasource = addressDatasource;

  final LocationDatasourceRepository _locationDatasource;
  final AddressLocationRepository _addressDatasource;
  @override
  Future<LocationModel> getCurrentLocation() async {
    final LatLng location = await _locationDatasource.getCurrentLocation();
    final String address = await _addressDatasource.getCurrentAddress(
      location: location,
    );
    return LocationModel(
      address: address,
      location: location,
    );
  }
}
