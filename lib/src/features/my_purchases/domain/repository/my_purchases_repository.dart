import 'package:quickdrop/src/features/my_purchases/domain/entity/my_purchases_entity.dart';

abstract class MyPurchasesRepository {
  Stream<List<MyPurchasesEntity>> getMyPurchases();
}
