part of 'purchase_detail_cubit.dart';

sealed class PurchaseDetailState extends Equatable {
  const PurchaseDetailState();

  @override
  List<Object> get props => <Object>[];
}

final class PurchaseDetailInitial extends PurchaseDetailState {}

final class Loading extends PurchaseDetailState {}

final class Error extends PurchaseDetailState {
  const Error({required this.message});

  final String message;

  @override
  List<Object> get props => <Object>[message];
}

class Success extends PurchaseDetailState {
  const Success({required this.purchaseDetail});

  final PurchaseEntity purchaseDetail;

  @override
  List<Object> get props => <Object>[purchaseDetail];
}
