import 'package:quickdrop/src/features/my_purchases/domain/entity/purchase_entity.dart';

class MyPurchasesEntity {
  MyPurchasesEntity({
    required this.purchase,
    required this.time,
  });
  final List<PurchaseEntity> purchase;
  final DateTime time;
}
