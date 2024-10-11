part of 'add_favorite_cubit.dart';

class AddFavoriteState extends Equatable {
  const AddFavoriteState({
    this.favorite = Favorite.removed,
    this.message = '',
  });
  final Favorite favorite;
  final String message;

  AddFavoriteState copyWith({
    Favorite? favorite,
    String? message,
  }) {
    return AddFavoriteState(
      favorite: favorite ?? this.favorite,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => <Object?>[favorite, message];
}
