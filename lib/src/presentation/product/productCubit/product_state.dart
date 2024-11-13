part of 'product_cubit.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => <Object>[];
}

class LoadingProduct extends ProductDetailState {}

class ErrorLoadingProduct extends ProductDetailState {
  const ErrorLoadingProduct({
    required this.message,
  });
  final String message;
}

class SuccessLoadingProduct extends ProductDetailState {
  const SuccessLoadingProduct({
    required this.product,
  });
  final ProductDetailEntity product;
}
