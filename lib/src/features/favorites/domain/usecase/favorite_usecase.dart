import 'package:quickdrop/src/features/favorites/domain/entity/favorite_entity.dart';
import 'package:quickdrop/src/features/home/domain/entity/products_entity.dart';
import 'package:quickdrop/src/features/favorites/domain/repository/favorite_repository.dart';

class FavoritesUsecase {
  FavoritesUsecase({
    required FavoriteRepository repository,
  }) : _repository = repository;
  final FavoriteRepository _repository;
  Future<FavoriteEntity> checkFavorite({required String productId}) async =>
      await _repository.checkFavorite(
        productId: productId,
      );

  Future<FavoriteEntity> addTofavorite({required String productId}) async =>
      await _repository.addToFavorite(
        productId: productId,
      );
  Future<FavoriteEntity> removeFavorite({required String productId}) async =>
      await _repository.removeFavorite(productId: productId);

  Future<List<ProductsEntity>> getUserFavorites() async =>
      _repository.getUserFavorites();
}
