part of 'financial_information_cubit.dart';

sealed class FinancialInformationState extends Equatable {
  const FinancialInformationState();

  @override
  List<Object> get props => <Object>[];
}

final class Loading extends FinancialInformationState {}

final class Error extends FinancialInformationState {
  const Error({
    this.message = ' error al obtener los datos',
  });
  final String message;
}

final class Success extends FinancialInformationState {
  const Success({required this.product});
  final ProductDetailEntity product;
}

final class IncompleteData extends FinancialInformationState {}
