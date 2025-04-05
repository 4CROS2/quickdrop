import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';

class MyLocationsModel extends MyLocationsEntity {
  const MyLocationsModel({
    required super.id,
    required super.name,
    required super.address,
    required super.position,
    required super.isDefault,
  });

  static MyLocationsModel fromJson(Map<String, dynamic> json) {
    final GeoPoint jsonPosition = json['position'] as GeoPoint;
    return MyLocationsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      position: LatLng(
        jsonPosition.latitude,
        jsonPosition.longitude,
      ),
      isDefault: json['isDefault'] as bool,
    );
  }

  static MyLocationsModel fromEntity({required MyLocationsEntity entity}) {
    return MyLocationsModel(
      id: entity.id,
      name: entity.name,
      address: entity.address,
      position: entity.position,
      isDefault: entity.isDefault,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'position': GeoPoint(
        position.latitude,
        position.longitude,
      ),
      'isDefault': isDefault,
    };
  }
}
