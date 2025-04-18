import 'package:equatable/equatable.dart';

class CartProductEntity extends Equatable {
  const CartProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.total,
    required this.productImage,
  });
  final String id;
  final String name;
  final String description;
  final int quantity;
  final int total;
  final String productImage;

  @override
  List<Object?> get props => <Object?>[
        id,
        quantity,
        total,
        productImage,
      ];
}
