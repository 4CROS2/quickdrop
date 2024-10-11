import 'package:quickdrop/src/domain/entity/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  FavoriteModel({
    required super.message,
    required super.favoriteState,
  });
  static FavoriteModel fromJson({required Map<String, dynamic> json}) {
    Favorite favorite = Favorite.removed;
    if (json['state'] == true) {
      favorite = Favorite.added;
    } else {
      favorite = Favorite.removed;
    }
    return FavoriteModel(
      message: json['message'],
      favoriteState: favorite,
    );
  }
}
