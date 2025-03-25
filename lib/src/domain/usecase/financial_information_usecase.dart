import 'package:quickdrop/src/feature/productDetail/domain/entity/product_detail_entity.dart';
import 'package:quickdrop/src/domain/repository/financial_information_repository.dart';

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
