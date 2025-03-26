import 'package:quickdrop/src/features/productDetail/domain/entity/product_detail_entity.dart';
import 'package:quickdrop/src/features/financial_information/domain/repository/financial_information_repository.dart';

class FinancialInformationUsecase {
  FinancialInformationUsecase({
    required FinancialInformationRepository repository,
  }) : _repository = repository;
  final FinancialInformationRepository _repository;

  Future<ProductDetailEntity> call({
    required String productId,
  }) async =>
      _repository.verifyData(
        productId: productId,
      );
}
