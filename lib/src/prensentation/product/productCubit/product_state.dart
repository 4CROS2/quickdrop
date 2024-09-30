part of 'product_cubit.dart';

class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => <Object>[];
}

class LoadingProducts extends ProductState{}

class ErrorLoadingProducts extends ProductState{}

class SuccessLoadingProducts extends ProductState{}
