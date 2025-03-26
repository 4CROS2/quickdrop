import 'package:quickdrop/src/features/my_purchases/data/model/purchase_model.dart';
import 'package:quickdrop/src/features/my_purchases/domain/entity/my_purchases_entity.dart';
import 'package:quickdrop/src/features/my_purchases/domain/entity/purchase_entity.dart';

class MyPurchasesModel extends MyPurchasesEntity {
  MyPurchasesModel({
    required super.purchase,
    required super.time,
  });

  static MyPurchasesModel fromJson({required Map<String, dynamic> json}) {
    try {
      final List<PurchaseEntity> rawPurchase =
          json['purchase'] as List<PurchaseEntity>;
      final DateTime rawTime = json['time'] as DateTime;
      return MyPurchasesModel(
        purchase: rawPurchase
            .map(
              // ignore: always_specify_types
              (e) => PurchaseModel.fromEntity(entity: e),
            )
            .toList(),
        time: rawTime,
      );
    } catch (e) {
      rethrow;
    }
  }
}
