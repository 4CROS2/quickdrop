import 'package:quickdrop/src/domain/entity/add_favorite_entity.dart';

class AddFavoriteModel extends AddFavoriteEntity {
  AddFavoriteModel({
    required super.message,
    required super.favoriteState,
  });
  static AddFavoriteModel fromJson({required Map<String, dynamic> json}) {
    Favorite favorite = Favorite.removed;
    if (json['state'] == true) {
      favorite = Favorite.added;
    } else {
      favorite = Favorite.removed;
    }
    return AddFavoriteModel(
      message: json['message'],
      favoriteState: favorite,
    );
  }
}
