import 'package:quickdrop/src/domain/entity/my_purchases_entity.dart';
import 'package:quickdrop/src/domain/repository/my_purchases_repository.dart';

class MyPurchasesUsecase {
  MyPurchasesUsecase({
    required MyPurchasesRepository repository,
  }) : _repository = repository;
  final MyPurchasesRepository _repository;

  Future<List<MyPurchasesEntity>> getMyPurchases() async {
    return await _repository.getMyPurchases();
  }
}
