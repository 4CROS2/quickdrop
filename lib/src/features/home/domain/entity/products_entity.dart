import 'package:equatable/equatable.dart';
import 'package:quickdrop/src/features/home/domain/entity/rating_product.dart';

class ProductsEntity extends Equatable {
  const ProductsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.basePrice,
    required this.sellerId,
    required this.baseImages,
    required this.ratings,
    //required this.tags,
  });
  final String id;
  final String name;
  final String description;
  final int basePrice;
  final String sellerId;
  final List<String> baseImages;
  final List<ProductRatingEntity> ratings;

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        description,
        basePrice,
        sellerId,
        baseImages,
        ratings,
      ];
}
