import 'package:quickdrop/src/domain/entity/add_favorite_entity.dart';
import 'package:quickdrop/src/domain/repository/add_to_favorite_repository.dart';

class AddToFavoriteUsecase {
  AddToFavoriteUsecase({
    required AddToFavoriteRepository repository,
  }) : _repository = repository;
  final AddToFavoriteRepository _repository;
  Future<AddFavoriteEntity> checkFavorite({required String productId}) async =>
      await _repository.checkFavorite(
        productId: productId,
      );

  Future<AddFavoriteEntity> addTofavorite({required String productId}) async =>
      await _repository.addToFavorite(
        productId: productId,
      );
  Future<AddFavoriteEntity> removeFavorite({required String productId}) async =>
      await _repository.removeFavorite(productId: productId);
}
