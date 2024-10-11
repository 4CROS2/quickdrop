import 'package:quickdrop/src/data/datasource/add_to_favorite_datasource.dart';
import 'package:quickdrop/src/data/model/add_favorite_model.dart';
import 'package:quickdrop/src/domain/repository/add_to_favorite_repository.dart';

class IAddToFavoriteRepository implements AddToFavoriteRepository {
  IAddToFavoriteRepository({
    required AddToFavoriteDatasource datasource,
  }) : _datasource = datasource;
  final AddToFavoriteDatasource _datasource;

  @override
  Future<AddFavoriteModel> checkFavorite({required String productId}) async {
    final Map<String, dynamic> response = await _datasource.isFavorite(
      productId: productId,
    );
    return AddFavoriteModel.fromJson(
      json: response,
    );
  }

  @override
  Future<AddFavoriteModel> addToFavorite({required String productId}) async {
    final Map<String, dynamic> response = await _datasource.addToFavorite(
      productId: productId,
    );
    return AddFavoriteModel.fromJson(json: response);
  }

  @override
  Future<AddFavoriteModel> removeFavorite({required String productId}) async {
    final Map<String, dynamic> response = await _datasource.removeFavorite(
      productId: productId,
    );

    return AddFavoriteModel.fromJson(
      json: response,
    );
  }
}
