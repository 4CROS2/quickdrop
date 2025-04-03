import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class LocationEntity extends Equatable {
  const LocationEntity({
    required this.address,
    required this.location,
  });

  final String address;
  final LatLng location;

  @override
  List<Object> get props => <Object>[address, location];
}
