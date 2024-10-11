enum Favorite { added, removed }

class AddFavoriteEntity {
  AddFavoriteEntity({
    required this.message,
    required this.favoriteState,
  });
  final String message;
  final Favorite favoriteState;
}
