import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/feature/productDetail/domain/entity/product_detail_entity.dart';
import 'package:quickdrop/src/domain/usecase/financial_information_usecase.dart';

part 'financial_information_state.dart';

class FinancialInformationCubit extends Cubit<FinancialInformationState> {
  FinancialInformationCubit({required FinancialInformationUsecase usecase})
      : _usecase = usecase,
        super(Loading());
  final FinancialInformationUsecase _usecase;

  Future<void> getInformationalInformation({required String productId}) async {
    try {
      final ProductDetailEntity response = await _usecase.call(
        productId: productId,
      );
      emit(Success(product: response));
    } catch (e) {
      emit(Error());
    }
  }
}
