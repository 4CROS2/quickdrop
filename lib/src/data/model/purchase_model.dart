import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:uuid/uuid.dart';

class PurchaseModel extends PurchaseEntity {
  const PurchaseModel({
    required super.buyerId,
    required super.orderId,
    required super.sellerId,
    required super.productId,
    required super.currentPrice,
    required super.quantity,
    required super.description,
    required super.createdAt,
    required super.productName,
    required super.imagePath,
    required super.totalPaid,
    required super.address,
    required super.deliverymethod,
  });

  static PurchaseModel fromJson({required Map<String, dynamic> json}) {
    final Timestamp time = json['created_at'];
    return PurchaseModel(
      address: json['address'],
      productName: json['product_name'],
      buyerId: json['buyer_id'],
      productId: json['product_id'],
      sellerId: json['seller_id'],
      imagePath: json['image'],
      quantity: json['quantity'],
      currentPrice: json['sell_price'],
      orderId: json['order_id'],
      description: json['description'],
      createdAt: time,
      totalPaid: json['total_paid'] as int,
      deliverymethod: Deliverymethod.values[json['delivery_method']],
    );
  }

  static String _generateOrderId() {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final String uniqueId = const Uuid().v4().substring(0, 8);
    return '$timestamp-$uniqueId';
  }

  int _setTotalPaid() {
    return currentPrice * quantity;
  }

  FieldValue get _currentTime => FieldValue.serverTimestamp();

  String get _orderId => _generateOrderId();

  int get _total => _setTotalPaid();

  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'product_name': productName,
        'buyer_id': buyerId,
        'order_id': _orderId,
        'product_id': productId,
        'seller_id': sellerId,
        'quantity': quantity,
        'image': imagePath,
        'sell_price': currentPrice,
        'description': description,
        'created_at': _currentTime,
        'total_paid': _total,
        'delivery_method': deliverymethod.index,
      };

  factory PurchaseModel.fromEntity({required PurchaseEntity entity}) {
    return PurchaseModel(
      productName: entity.productName,
      buyerId: entity.buyerId,
      currentPrice: entity.currentPrice,
      orderId: entity.orderId,
      imagePath: entity.imagePath,
      productId: entity.productId,
      quantity: entity.quantity,
      sellerId: entity.sellerId,
      description: entity.description,
      createdAt: entity.createdAt,
      totalPaid: entity.totalPaid,
      address: entity.address,
      deliverymethod: entity.deliverymethod,
    );
  }
}
