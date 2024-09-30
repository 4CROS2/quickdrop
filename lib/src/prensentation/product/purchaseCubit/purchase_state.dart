part of 'purchase_cubit.dart';

class PurchaseState extends Equatable {
  const PurchaseState({
    this.quantity = 1,
  });
  final int quantity;

  PurchaseState copyWith({
    int? quantity,
  }) {
    return PurchaseState(
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => <Object>[quantity];
}
