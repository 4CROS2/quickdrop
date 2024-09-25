part of 'purchase_cubit.dart';

sealed class PurchaseState extends Equatable {
  const PurchaseState();

  @override
  List<Object> get props => <Object>[];
}

final class PurchaseInitial extends PurchaseState {}
