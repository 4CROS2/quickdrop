import 'package:quickdrop/src/features/purchase_detail/data/datasource/purchase_detail_datasource.dart';
import 'package:quickdrop/src/features/my_purchases/data/model/purchase_model.dart';
import 'package:quickdrop/src/features/my_purchases/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/features/purchase_detail/domain/repository/purchase_detail_repository.dart';

class IPurchaseDetailRepository extends PurchaseDetailRepository {
  IPurchaseDetailRepository({
    required PurchaseDetailDatasource datasource,
  }) : _datasource = datasource;

  final PurchaseDetailDatasource _datasource;

  @override
  Stream<PurchaseEntity> getProductData({
    required String orderId,
    required String sellerId,
  }) {
    final Stream<Map<String, dynamic>> response = _datasource.getPurchaseDetail(
      orderId: orderId,
      sellerId: sellerId,
    );
    return response.map(
      (Map<String, dynamic> event) => PurchaseModel.fromJson(
        json: event,
      ),
    );
  }
}
