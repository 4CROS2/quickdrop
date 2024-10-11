import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/domain/entity/add_favorite_entity.dart';
import 'package:quickdrop/src/domain/usecase/add_to_favorite_usecase.dart';

part 'add_favorite_state.dart';

class AddToFavoriteCubit extends Cubit<AddFavoriteState> {
  AddToFavoriteCubit({
    required AddToFavoriteUsecase usecase,
  })  : _usecase = usecase,
        super(AddFavoriteState());

  final AddToFavoriteUsecase _usecase;

  void checkFavorite({required String productId}) async {
    try {
      final AddFavoriteEntity response =
          await _usecase.checkFavorite(productId: productId);

      if (!isClosed) {
        emit(
          state.copyWith(
            favorite: response.favoriteState,
            message: response.message,
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(state);
      }
    }
  }

  void addOrRemoveToFavorite({required String productId}) async {
    try {
      if (state.favorite == Favorite.removed) {
        final AddFavoriteEntity response =
            await _usecase.addTofavorite(productId: productId);

        if (!isClosed) {
          emit(state.copyWith(
            message: response.message,
            favorite: response.favoriteState,
          ));
        }
      } else {
        final AddFavoriteEntity response =
            await _usecase.removeFavorite(productId: productId);

        if (!isClosed) {
          emit(
            state.copyWith(
              message: response.message,
              favorite: response.favoriteState,
            ),
          );
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            message: e.toString(),
            favorite: state.favorite,
          ),
        );
      }
    }
  }
}
