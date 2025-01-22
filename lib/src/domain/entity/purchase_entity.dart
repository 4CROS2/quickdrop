import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PurchaseEntity extends Equatable {
  const PurchaseEntity({
    required this.productName,
    required this.buyerId,
    required this.orderId,
    required this.sellerId,
    required this.quantity,
    required this.productId,
    required this.currentPrice,
    required this.totalPaid,
    required this.description,
    required this.createdAt,
    required this.imagePath,
  });
  final String productName;
  final String orderId;
  final String productId;
  final String sellerId;
  final String description;
  final String buyerId;
  final int quantity;
  final int currentPrice;
  final int totalPaid;
  final FieldValue? createdAt;
  final String imagePath;

  PurchaseEntity copyWith({
    String? productName,
    String? buyerId,
    String? productId,
    String? orderId,
    String? sellerId,
    String? imagePath,
    int? quantity,
    int? currentPrice,
    int? totalPaid,
    String? description,
    FieldValue? createdAt,
  }) =>
      PurchaseEntity(
        productName: productName ?? this.productName,
        buyerId: buyerId ?? this.buyerId,
        orderId: orderId ?? this.orderId,
        sellerId: sellerId ?? this.sellerId,
        description: description ?? this.description,
        productId: productId ?? this.productId,
        imagePath: imagePath ?? this.imagePath,
        quantity: quantity ?? this.quantity,
        currentPrice: currentPrice ?? this.currentPrice,
        createdAt: createdAt ?? this.createdAt,
        totalPaid: totalPaid ?? this.totalPaid,
      );

  const PurchaseEntity.empty()
      : productName = '',
        orderId = '',
        buyerId = '',
        description = 'sin descripcion',
        productId = '',
        sellerId = '',
        imagePath = '',
        currentPrice = 0,
        quantity = 1,
        createdAt = null,
        totalPaid = 0;

  @override
  List<Object?> get props => <Object?>[
        orderId,
        description,
        productId,
        sellerId,
        currentPrice,
        quantity,
        createdAt,
        imagePath,
        totalPaid
      ];
}
