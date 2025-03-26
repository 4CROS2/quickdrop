import 'package:quickdrop/src/features/home/domain/entity/sellers_entity.dart';

class SellersModel extends SellersEntity {
  const SellersModel({
    required super.id,
    required super.name,
    required super.image,
    required super.sellerId,
    required super.isAvailable,
  });

  static SellersModel fromJson({required Map<String, dynamic> json}) {
    return SellersModel(
      id: json['id'] ?? 0,
      name: json['company_name'] ?? '',
      image: json['brand'] ?? '',
      sellerId: json['id'] ?? '',
      isAvailable: json['is_available'] ?? false,
    );
  }
}
