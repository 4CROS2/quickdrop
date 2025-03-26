part of 'favorites_cubit.dart';

enum FavoriteStatus { loading, error, success, waiting }

class FavoritesState extends Equatable {
  const FavoritesState({
    this.favorites = const <ProductsEntity>[],
    this.favoriteStatus = FavoriteStatus.waiting,
    this.message = '',
  });
  final List<ProductsEntity> favorites;
  final FavoriteStatus favoriteStatus;
  final String message;
  FavoritesState copyWith(
          {List<ProductsEntity>? favorites,
          FavoriteStatus? favoriteStatus,
          String? message}) =>
      FavoritesState(
          favoriteStatus: favoriteStatus ?? this.favoriteStatus,
          favorites: favorites ?? this.favorites,
          message: message ?? this.message);

  @override
  List<Object> get props => <Object>[favorites, favoriteStatus, message];
}
