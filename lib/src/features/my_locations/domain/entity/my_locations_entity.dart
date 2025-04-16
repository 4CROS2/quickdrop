import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class MyLocationsEntity extends Equatable {
  const MyLocationsEntity({
    required this.id,
    required this.name,
    required this.distric,
    required this.address,
    required this.description,
    required this.position,
    required this.isDefault,
    required this.createAt,
    required this.modifiedAt,
    required this.mapImage,
  });

  final String id;
  final String name;
  final String address;
  final String distric;
  final String description;
  final LatLng position;
  final bool isDefault;
  final DateTime createAt;
  final DateTime modifiedAt;
  final Uint8List mapImage;

  MyLocationsEntity copyWith({
    String? id,
    String? name,
    String? address,
    String? distric,
    String? description,
    LatLng? position,
    bool? isDefault,
    Uint8List? mapImage,
    DateTime? createAt,
    DateTime? modifiedAt,
  }) {
    return MyLocationsEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      distric: distric ?? this.distric,
      address: address ?? this.address,
      description: description ?? this.description,
      position: position ?? this.position,
      isDefault: isDefault ?? this.isDefault,
      mapImage: mapImage ?? this.mapImage,
      createAt: createAt ?? this.createAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }

  static MyLocationsEntity empty = MyLocationsEntity(
    id: '',
    address: '',
    name: '',
    description: '',
    position: const LatLng(0, 0),
    distric: '',
    mapImage: Uint8List.fromList(<int>[]),
    isDefault: false,
    createAt: DateTime.now(),
    modifiedAt: DateTime.now(),
  );

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        address,
        position,
        mapImage,
        distric,
        description,
        isDefault,
        createAt,
        modifiedAt,
      ];
}
