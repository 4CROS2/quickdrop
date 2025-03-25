import 'package:quickdrop/src/data/datasource/favorite_datasource.dart';
import 'package:quickdrop/src/data/model/add_favorite_model.dart';
import 'package:quickdrop/src/feature/home/data/model/products_model.dart';
import 'package:quickdrop/src/domain/repository/favorite_repository.dart';

class IFavoriteRepository implements FavoriteRepository {
  IFavoriteRepository({
    required AddToFavoriteDatasource datasource,
  }) : _datasource = datasource;
  final AddToFavoriteDatasource _datasource;

  @override
  Future<FavoriteModel> checkFavorite({required String productId}) async {
    final Map<String, dynamic> response = await _datasource.isFavorite(
      productId: productId,
    );
    return FavoriteModel.fromJson(
      json: response,
    );
  }

  @override
  Future<FavoriteModel> addToFavorite({required String productId}) async {
    final Map<String, dynamic> response = await _datasource.addToFavorite(
      productId: productId,
    );
    return FavoriteModel.fromJson(json: response);
  }

  @override
  Future<FavoriteModel> removeFavorite({required String productId}) async {
    final Map<String, dynamic> response = await _datasource.removeFavorite(
      productId: productId,
    );

    return FavoriteModel.fromJson(
      json: response,
    );
  }

  @override
  Future<List<ProductsModel>> getUserFavorites() async {
    final Map<String, dynamic> response =
        await _datasource.getFavoriteProducts();
    final List<dynamic> favoriteList = response['favorites'];
    return favoriteList
        .map(
          // ignore: always_specify_types
          (favoriteProduct) => ProductsModel.fromJson(json: favoriteProduct),
        )
        .toList();
  }
}
