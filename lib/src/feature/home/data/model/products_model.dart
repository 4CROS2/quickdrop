import 'package:quickdrop/src/data/model/product_rating_model.dart';
import 'package:quickdrop/src/feature/home/domain/entity/products_entity.dart';

class ProductsModel extends ProductsEntity {
  const ProductsModel({
    required super.id,
    required super.name,
    required super.description,
    required super.basePrice,
    required super.sellerId,
    required super.baseImages,
    required super.ratings,
  });

  static ProductsModel fromJson({required Map<String, dynamic> json}) {
    List<String> jsonImages = List<String>.from(
      json['base_images'] ?? <String>[],
    );
    List<Map<String, dynamic>> jsonRatings = List<Map<String, dynamic>>.from(
      json['ratings'] ?? <dynamic>[],
    );

    final List<ProductRatingModel> ratings = jsonRatings.map(
      (Map<String, dynamic> rating) {
        return ProductRatingModel.fromJson(
          json: rating,
        );
      },
    ).toList();

    return ProductsModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? '',
      basePrice: json['base_price'] ?? 0,
      sellerId: json['seller_id'] ?? '',
      baseImages: jsonImages,
      ratings: ratings,
    );
  }
}
