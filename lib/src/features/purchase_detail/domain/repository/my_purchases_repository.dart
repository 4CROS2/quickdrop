import 'package:quickdrop/src/features/purchase_detail/domain/entity/my_purchases_entity.dart';

abstract class MyPurchasesRepository {
  Stream<List<MyPurchasesEntity>> getMyPurchases();
}
