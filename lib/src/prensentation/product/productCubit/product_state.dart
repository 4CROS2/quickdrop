part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => <Object>[];
}

final class ProductInitial extends ProductState {}
