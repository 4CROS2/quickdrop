import 'package:equatable/equatable.dart';

class PurchaseEntity extends Equatable {
  const PurchaseEntity({
    required this.buyerId,
    required this.orderId,
    required this.sellerId,
    required this.quantity,
    required this.productId,
    required this.orderTime,
    required this.currentPrice,
    required this.description,
  });

  final String orderId;
  final String productId;
  final String sellerId;
  final String orderTime;
  final String description;
  final String buyerId;
  final int quantity;
  final int currentPrice;

  PurchaseEntity copyWith({
    String? buyerId,
    String? productId,
    String? orderId,
    String? sellerId,
    int? quantity,
    int? currentPrice,
    String? description,
  }) =>
      PurchaseEntity(
        buyerId: buyerId ?? this.buyerId,
        orderId: orderId ?? this.orderId,
        sellerId: sellerId ?? this.sellerId,
        description: description ?? this.description,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        currentPrice: currentPrice ?? this.currentPrice,
        orderTime: '',
      );

  const PurchaseEntity.empty()
      : orderId = '',
        buyerId = '',
        description = 'sin descripcion',
        productId = '',
        sellerId = '',
        orderTime = '',
        currentPrice = 0,
        quantity = 1;

  @override
  List<Object?> get props => <Object?>[
        orderId,
        description,
        productId,
        sellerId,
        orderTime,
        currentPrice,
        quantity,
      ];
}
