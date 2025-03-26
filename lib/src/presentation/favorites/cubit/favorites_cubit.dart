import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/domain/entity/favorite_entity.dart';
import 'package:quickdrop/src/features/home/domain/entity/products_entity.dart';
import 'package:quickdrop/src/domain/usecase/favorite_usecase.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({
    required FavoritesUsecase usecase,
  })  : _usecase = usecase,
        super(FavoritesState());
  final FavoritesUsecase _usecase;
  Future<void> getUserFavorites() async {
    try {
      emit(
        state.copyWith(favoriteStatus: FavoriteStatus.loading),
      );
      final List<ProductsEntity> response = await _usecase.getUserFavorites();
      emit(
        state.copyWith(
          favorites: response,
          favoriteStatus: FavoriteStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          message: e.toString(),
          favoriteStatus: FavoriteStatus.error,
        ),
      );
    }
  }

  Future<void> deleteFavoriteProduct({required String productId}) async {
    try {
      final FavoriteEntity response =
          await _usecase.removeFavorite(productId: productId);
      if (response.favoriteState == Favorite.removed) {
        emit(
          state.copyWith(
            favorites: state.favorites
                .where((ProductsEntity product) => product.id != productId)
                .toList(),
            message: response.message,
            favoriteStatus: FavoriteStatus.success,
          ),
        );
        emit(
          state.copyWith(message: ''),
        );
      } else {
        emit(
          state.copyWith(message: response.message),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          message: e.toString(),
        ),
      );
    }
  }
}
