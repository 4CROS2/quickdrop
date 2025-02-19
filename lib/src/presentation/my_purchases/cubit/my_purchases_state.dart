part of 'my_purchases_cubit.dart';

sealed class MyPurchasesState extends Equatable {
  const MyPurchasesState();

  @override
  List<Object> get props => <Object>[];
}

class Loading extends MyPurchasesState {}

class Error extends MyPurchasesState {
  const Error({required this.message});

  final String message;

  @override
  List<Object> get props => <Object>[message];
}

class Success extends MyPurchasesState {
  const Success({required this.purchases});

  final List<MyPurchasesEntity> purchases;

  @override
  List<Object> get props => <Object>[purchases];
}
