import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class MyLocationsEntity extends Equatable {
  const MyLocationsEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.position,
    required this.isDefault,
  });

  final String id;
  final String name;
  final String address;
  final LatLng position;
  final bool isDefault;

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        address,
        position,
        isDefault,
      ];
}
