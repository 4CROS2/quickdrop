import 'package:quickdrop/src/domain/entity/products_entity.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel({
    required super.id,
    required super.name,
    required super.description,
    required super.basePrice,
    required super.sellerId,
    required super.baseImages,
  });

  static ProductsModel fromJson({required Map<String, dynamic> json}) {
    // Verificar si 'seller_id' es un DocumentReference y convertirlo a String

    List<dynamic> jsonImages = json['base_images'];
    List<String> images = <String>[];

    images = List<String>.from(
      jsonImages.map(
        // ignore: always_specify_types
        (image) => image.toString(),
      ),
    );

    return ProductsModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? '',
      basePrice: json['base_price'] ?? 0,
      sellerId: json['seller_id'],
      baseImages: images,
    );
  }
}
