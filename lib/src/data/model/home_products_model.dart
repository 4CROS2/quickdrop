import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickdrop/src/domain/entity/home_products.dart';

class HomeProductsModel extends HomeProductsEntity {
  HomeProductsModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.sellerId,
    required super.images,
  });

  static HomeProductsModel fromJson({required Map<String, dynamic> json}) {
    // Verificar si 'seller_id' es un DocumentReference y convertirlo a String
    String sellerId;
    if (json['seller_id'] is DocumentReference) {
      // ignore: always_specify_types
      sellerId = (json['seller_id'] as DocumentReference).id;
    } else {
      sellerId = json['seller_id'] ?? '';
    }
    List<dynamic> jsonImages = json['images'];
    List<String> images = <String>[];
    if (json['images'] != null && json['images'] is List) {
      images = List<String>.from(
        jsonImages.map(
          // ignore: always_specify_types
          (image) => image.toString(),
        ),
      );
    }
    return HomeProductsModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      sellerId: sellerId,
      images: images,
    );
  }
}
