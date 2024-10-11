enum Favorite { added, removed }

class FavoriteEntity {
  FavoriteEntity({
    required this.message,
    required this.favoriteState,
  });
  final String message;
  final Favorite favoriteState;
}
