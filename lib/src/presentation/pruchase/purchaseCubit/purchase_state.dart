part of 'purchase_cubit.dart';

enum PurchaseStatus { initial, loading, success, error }

class PurchaseState extends Equatable {
  const PurchaseState({
    this.product = const PurchaseEntity.empty(),
    this.purchaseStatus = PurchaseStatus.initial,
  });
  final PurchaseEntity product;
  final PurchaseStatus purchaseStatus;

  PurchaseState copyWith({
    PurchaseEntity? product,
    PurchaseStatus? purchaseStatus,
  }) {
    return PurchaseState(
      product: product ?? this.product,
      purchaseStatus: purchaseStatus ?? this.purchaseStatus,
    );
  }

  @override
  List<Object> get props => <Object>[product, purchaseStatus];
}
