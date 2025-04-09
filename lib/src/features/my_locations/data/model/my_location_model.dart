import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';

class MyLocationsModel extends MyLocationsEntity {
  const MyLocationsModel({
    required super.id,
    required super.name,
    required super.address,
    required super.distric,
    required super.description,
    required super.position,
    required super.isDefault,
    required super.mapImage,
    required super.createAt,
    required super.modifiedAt,
  });

  static MyLocationsModel fromJson(Map<String, dynamic> json) {
    final GeoPoint jsonPosition = json['location'] as GeoPoint;
    return MyLocationsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      distric: json['distric'],
      description: json['description'],
      position: LatLng(
        jsonPosition.latitude,
        jsonPosition.longitude,
      ),
      mapImage: json['mapImage'],
      isDefault: json['isDefault'] as bool,
      createAt: (json['createdAt'] as Timestamp).toDate(),
      modifiedAt: (json['modifiedAt'] as Timestamp).toDate(),
    );
  }

  static MyLocationsModel fromEntity({required MyLocationsEntity entity}) {
    return MyLocationsModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      distric: entity.distric,
      address: entity.address,
      position: entity.position,
      isDefault: entity.isDefault,
      mapImage: entity.mapImage,
      createAt: entity.createAt,
      modifiedAt: entity.modifiedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'address': address,
      'distric': distric,
      'description': description,
      'location': GeoPoint(
        position.latitude,
        position.longitude,
      ),
      'isDefault': isDefault,
      'createdAt': Timestamp.fromDate(createAt),
      'modifiedAt': Timestamp.fromDate(modifiedAt),
    };
  }
}
