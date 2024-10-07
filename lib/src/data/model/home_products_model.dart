import 'package:quickdrop/src/domain/entity/home_products.dart';

class HomeProductsModel extends HomeProductsEntity {
  HomeProductsModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.sellerId,
  });
  static HomeProductsModel fromJson({required Map<String, dynamic> json}) {
    return HomeProductsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      sellerId: json['seller_id'],
    );
  }
}
