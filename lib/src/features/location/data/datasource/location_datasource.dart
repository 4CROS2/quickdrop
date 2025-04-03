import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:quickdrop/src/features/location/domain/repository/location_datasource_repository.dart';

class ILocationDatasource implements LocationDatasourceRepository {
  final Location _location = Location();

  Future<bool> get _isEnabled async => await _location.serviceEnabled();

  Future<bool> get _requestEnable async => await _location.requestService();

  Future<PermissionStatus> get _getStatusPermission async =>
      _location.hasPermission();

  Future<PermissionStatus> get _requestPermission async =>
      await _location.requestPermission();

  Future<void> _getPermissions() async {
    try {
      if (!await _isEnabled) {
        final bool response = await _requestEnable;
        if (!response) {
          throw 'servicio no activado';
        }
      }
      if (await _getStatusPermission == PermissionStatus.denied) {
        final PermissionStatus response = await _requestPermission;
        if (response != PermissionStatus.granted) {
          throw 'El servicio de ubicación no está activado';
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<LatLng> getCurrentLocation() async {
    try {
      await _getPermissions();
      final LocationData locationdata = await _location.getLocation();
      if (locationdata.latitude == null || locationdata.longitude == null) {
        throw Exception('No se pudo obtener la ubicación actual.');
      }
      return LatLng(locationdata.latitude!, locationdata.longitude!);
    } catch (e) {
      throw Exception(e);
    }
  }
}
