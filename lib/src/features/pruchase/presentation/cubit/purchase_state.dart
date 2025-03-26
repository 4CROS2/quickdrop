part of 'purchase_cubit.dart';

enum PurchaseStatus { initial, loading, success, error }

class PurchaseState extends Equatable {
  const PurchaseState({
    this.message = '',
    this.purchaseId = '',
    this.product = PurchaseEntity.empty,
    this.purchaseStatus = PurchaseStatus.initial,
  });
  final PurchaseEntity product;
  final PurchaseStatus purchaseStatus;
  final String purchaseId;
  final String message;
  PurchaseState copyWith({
    PurchaseEntity? product,
    PurchaseStatus? purchaseStatus,
    String? message,
    String? purchaseId,
  }) {
    return PurchaseState(
      product: product ?? this.product,
      purchaseStatus: purchaseStatus ?? this.purchaseStatus,
      message: message ?? this.message,
      purchaseId: purchaseId ?? this.purchaseId,
    );
  }

  @override
  List<Object> get props => <Object>[
        product,
        purchaseStatus,
        message,
        purchaseId,
      ];
}
