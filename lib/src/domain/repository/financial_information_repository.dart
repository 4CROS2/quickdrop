import 'package:quickdrop/src/domain/entity/product_detail_entity.dart';

abstract class FinancialInformationRepository {
  Future<ProductDetailEntity> verifyData({required String productId});
}
