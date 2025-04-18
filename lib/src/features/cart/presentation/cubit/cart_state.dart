part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => <Object>[];
}

class Loading extends CartState {}

class Error extends CartState {
  const Error({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[message];
}

class Success extends CartState {
  const Success({
    required this.products,
  });

  final List<CartProductEntity> products;

  @override
  List<Object> get props => <Object>[products];
}
