import 'package:quickdrop/src/data/datasource/purchase_datasource.dart';
import 'package:quickdrop/src/data/model/purchase_model.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/domain/repository/purchase_repository.dart';

class IPurchaseRepository implements PurchaseRepository {
  IPurchaseRepository({
    required PurchaseDatasource datasource,
  }) : _datasource = datasource;
  final PurchaseDatasource _datasource;

  @override
  Future<String> purchaseProduct({
    required PurchaseEntity product,
  }) async {
    try {
      return await _datasource.saveOrder(
        purchase: PurchaseModel.fromEntity(
          entity: product,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
