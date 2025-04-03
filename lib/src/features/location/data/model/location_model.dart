import 'package:quickdrop/src/features/location/domain/entity/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required super.address,
    required super.location,
  });

  static LocationModel fromEntity({required LocationEntity entity}) {
    return LocationModel(
      address: entity.address,
      location: entity.location,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'address': address,
      'location': location,
    };
  }
}
