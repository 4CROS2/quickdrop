import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickdrop/src/features/location/data/model/location_model.dart';
import 'package:quickdrop/src/features/location/domain/repository/address_location_datasource_repository.dart';
import 'package:quickdrop/src/features/location/domain/repository/location_datasource_repository.dart';
import 'package:quickdrop/src/features/location/domain/repository/location_repository.dart';

class ILocationRespository extends LocationRepository {
  ILocationRespository({
    required LocationDatasourceRepository locationDatasource,
    required AddressLocationDatasourceRepository addressDatasource,
  })  : _locationDatasource = locationDatasource,
        _addressDatasource = addressDatasource;

  final LocationDatasourceRepository _locationDatasource;
  final AddressLocationDatasourceRepository _addressDatasource;
  @override
  Future<LocationModel> getCurrentLocation() async {
    final LatLng location = await _locationDatasource.getCurrentLocation();
    final Placemark placemark = await _addressDatasource.getCurrentAddress(
      location: location,
    );

    final String address = _locationData(placemark: placemark);
    return LocationModel(
      address: address,
      location: location,
    );
  }

  @override
  Future<String> getAddress({required LatLng position}) async {
    final Placemark response =
        await _addressDatasource.getCurrentAddress(location: position);
    return _locationData(placemark: response);
  }

  String _locationData({required Placemark placemark}) {
    return '${placemark.street},${placemark.locality}';
  }
}
