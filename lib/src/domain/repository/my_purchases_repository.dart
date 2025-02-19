import 'package:quickdrop/src/domain/entity/my_purchases_entity.dart';

abstract class MyPurchasesRepository {
  Future<List<MyPurchasesEntity>> getMyPurchases();
}
