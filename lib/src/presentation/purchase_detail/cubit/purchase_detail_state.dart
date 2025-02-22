part of 'purchase_detail_cubit.dart';

sealed class PurchaseDetailState extends Equatable {
  const PurchaseDetailState();

  @override
  List<Object> get props => <Object>[];
}

final class PurchaseDetailInitial extends PurchaseDetailState {}
