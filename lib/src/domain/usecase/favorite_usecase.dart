import 'package:quickdrop/src/domain/entity/favorite_entity.dart';
import 'package:quickdrop/src/domain/repository/add_to_favorite_repository.dart';

class AddToFavoriteUsecase {
  AddToFavoriteUsecase({
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
}
