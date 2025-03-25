import 'package:quickdrop/src/feature/productDetail/data/datasource/produt_datasource.dart';
import 'package:quickdrop/src/feature/productDetail/data/model/product_details_model.dart';
import 'package:quickdrop/src/feature/productDetail/domain/repository/product_detail_repository.dart';

class IProductDetailRepository implements ProductDetailRepository {
  IProductDetailRepository({
    required ProductDetailDatasource datasource,
  }) : _datasource = datasource;

  final ProductDetailDatasource _datasource;

  @override
  Future<ProductDetailsModel> getProductData(
      {required String productId}) async {
    final Map<String, dynamic> response = await _datasource.getProductData(
      productId: productId,
    );
    return ProductDetailsModel.fromJson(json: response);
  }

  @override
  Future<void> addToLastSeen({required String productId}) async {
    await _datasource.addToLastSeen(productId: productId);
  }
}
