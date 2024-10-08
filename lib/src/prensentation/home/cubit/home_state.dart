part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => <Object>[];
}

class LoadingHomeData extends HomeState {}

class ErrorGettingHomeData extends HomeState {
  const ErrorGettingHomeData({
    required this.message,
  });
  final String message;
}

class SuccessHomeData extends HomeState {
  const SuccessHomeData({
    required this.products,
  });
  final List<HomeProductsEntity> products;
}
