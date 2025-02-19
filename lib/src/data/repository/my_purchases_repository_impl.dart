import 'package:quickdrop/src/data/datasource/my_purchases_datasource.dart';
import 'package:quickdrop/src/data/model/my_purchases_model.dart';
import 'package:quickdrop/src/data/model/purchase_model.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/domain/repository/my_purchases_repository.dart';

class IMyPurchasesRepository implements MyPurchasesRepository {
  IMyPurchasesRepository({
    required MyPurchasesDatasource datasource,
  }) : _datasource = datasource;

  final MyPurchasesDatasource _datasource;

  @override
  Future<List<MyPurchasesModel>> getMyPurchases() async {
    try {
      final List<Map<String, dynamic>> rawData =
          await _datasource.getMyPurchases();

      final List<PurchaseModel> purchases = rawData
          .map(
            (Map<String, dynamic> json) => PurchaseModel.fromJson(
              json: json,
            ),
          )
          .toList();

      final Map<DateTime, List<PurchaseEntity>> groupedData =
          <DateTime, List<PurchaseEntity>>{};

      for (final PurchaseModel purchase in purchases) {
        if (purchase.createdAt != null) {
          final DateTime dt =
              purchase.createdAt!.toDate().toUtc(); // Convertir a UTC
          final DateTime dayKey =
              DateTime.utc(dt.year, dt.month, dt.day); // Clave en UTC
          groupedData
              .putIfAbsent(dayKey, () => <PurchaseEntity>[])
              .add(purchase);
        }
      }

      final List<MyPurchasesModel> result = groupedData.entries.map(
        (MapEntry<DateTime, List<PurchaseEntity>> entry) {
          return MyPurchasesModel.fromJson(
            json: <String, dynamic>{
              'purchase': entry.value,
              'time': entry.key,
            },
          );
        },
      ).toList();

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
