import 'package:quickdrop/src/features/cart/domain/entity/cart_product_entity.dart';

class CartProdructModel extends CartProductEntity {
  const CartProdructModel({
    required super.id,
    required super.quantity,
    required super.total,
    required super.productImage,
    required super.name,
    required super.description,
  });

  static CartProdructModel fromJson({required Map<String, dynamic> json}) {
    final List<String> images = List<String>.from(json['base_images']);
    final int price = json['base_price'] as int;
    final int quantity = json['quantity'] as int;

    return CartProdructModel(
      id: json['id'] as String,
      name: json['name'],
      description: json['description'],
      quantity: quantity,
      total: quantity * price,
      productImage: images.first,
    );
  }
}
