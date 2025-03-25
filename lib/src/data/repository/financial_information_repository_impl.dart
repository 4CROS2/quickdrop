import 'package:quickdrop/src/data/datasource/financial_information_datasource.dart';
import 'package:quickdrop/src/feature/productDetail/data/model/product_details_model.dart';
import 'package:quickdrop/src/domain/repository/financial_information_repository.dart';

class IFinancialInformationRepository
    implements FinancialInformationRepository {
  IFinancialInformationRepository({
    required FinancialInformationDatasource datasource,
  }) : _datasource = datasource;
  final FinancialInformationDatasource _datasource;

  @override
  Future<ProductDetailsModel> verifyData({required String productId}) async {
    try {
      final Map<String, dynamic> data = await _datasource.verifyInformation(
        productId: productId,
      );
      return ProductDetailsModel.fromJson(json: data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
