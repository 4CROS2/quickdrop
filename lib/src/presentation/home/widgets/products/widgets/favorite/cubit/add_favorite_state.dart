part of 'add_favorite_cubit.dart';

class AddFavoriteState extends Equatable {
  const AddFavoriteState({
    this.favorite = Favorite.removed,
    this.message = '',
    this.isUserAction = false,
  });
  final Favorite favorite;
  final String message;
  final bool isUserAction;

  AddFavoriteState copyWith({
    Favorite? favorite,
    String? message,
    bool? isUserAction,
  }) {
    return AddFavoriteState(
      favorite: favorite ?? this.favorite,
      message: message ?? this.message,
      isUserAction: isUserAction ?? this.isUserAction,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        favorite,
        message,
        isUserAction,
      ];
}
