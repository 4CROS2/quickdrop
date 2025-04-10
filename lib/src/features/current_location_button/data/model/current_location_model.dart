import 'package:quickdrop/src/features/current_location_button/domain/entity/current_location_entity.dart';

class CurrentLocationModel extends CurrentLocationEntity {
  const CurrentLocationModel({
    required super.address,
    required super.name,
  });

  static CurrentLocationModel fromJson({required Map<String, dynamic> json}) {
    return CurrentLocationModel(
      address: json['address'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
