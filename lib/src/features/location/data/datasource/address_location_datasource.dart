import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickdrop/src/features/location/domain/repository/address_location_datasource_repository.dart';

class IAddressLocationDatasource
    implements AddressLocationDatasourceRepository {
  @override
  Future<Placemark> getCurrentAddress({required LatLng location}) async {
    final List<Placemark> response =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    return response[0];
  }
}
