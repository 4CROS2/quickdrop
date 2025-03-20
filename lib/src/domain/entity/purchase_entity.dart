import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quickdrop/src/domain/entity/status_timeline_entity.dart';

enum Deliverymethod { delivery, store, nullValue }

enum OrderStatus {
  pending,
  accepted,
  onTheWay,
  completed,
  canceled,
}

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
    required this.address,
    required this.deliverymethod,
    required this.statusTimeline,
  });
  final String productName;
  final String orderId;
  final String productId;
  final String sellerId;
  final OrderAddressEntity address;
  final String description;
  final String buyerId;
  final int quantity;
  final int currentPrice;
  final int totalPaid;
  final Deliverymethod deliverymethod;
  final Timestamp? createdAt;
  final String imagePath;
  final List<StatusTimelineEntity> statusTimeline;

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
    OrderAddressEntity? address,
    Timestamp? createdAt,
    Deliverymethod? deliverymethod,
    List<StatusTimelineEntity>? status,
  }) =>
      PurchaseEntity(
        productName: productName ?? this.productName,
        statusTimeline: status ?? statusTimeline,
        buyerId: buyerId ?? this.buyerId,
        orderId: orderId ?? this.orderId,
        sellerId: sellerId ?? this.sellerId,
        address: address ?? this.address,
        description: description ?? this.description,
        productId: productId ?? this.productId,
        imagePath: imagePath ?? this.imagePath,
        quantity: quantity ?? this.quantity,
        currentPrice: currentPrice ?? this.currentPrice,
        createdAt: createdAt ?? this.createdAt,
        totalPaid: totalPaid ?? this.totalPaid,
        deliverymethod: deliverymethod ?? this.deliverymethod,
      );

  static const PurchaseEntity empty = PurchaseEntity(
    productName: '',
    orderId: '',
    statusTimeline: <StatusTimelineEntity>[],
    buyerId: '',
    address: OrderAddressEntity.empty,
    description: 'sin descripcion',
    productId: '',
    sellerId: '',
    imagePath: '',
    currentPrice: 0,
    quantity: 1,
    createdAt: null,
    deliverymethod: Deliverymethod.nullValue,
    totalPaid: 0,
  );

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
        totalPaid,
        deliverymethod,
        address,
        statusTimeline
      ];
}

class OrderAddressEntity extends Equatable {
  const OrderAddressEntity({
    required this.location,
    required this.locationDescription,
  });
  final GeoPoint location;
  final String locationDescription;

  OrderAddressEntity copyWith({
    GeoPoint? location,
    String? locationDescription,
  }) =>
      OrderAddressEntity(
        location: location ?? this.location,
        locationDescription: locationDescription ?? this.locationDescription,
      );

  static const OrderAddressEntity empty = OrderAddressEntity(
    location: GeoPoint(0, 0),
    locationDescription: '',
  );

  @override
  List<Object?> get props => <Object?>[location, locationDescription];
}
