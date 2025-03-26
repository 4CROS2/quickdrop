import 'package:quickdrop/src/features/home/domain/entity/rating_product.dart';

double average({required List<ProductRatingEntity> ratings}) {
  final int ratingsLength = ratings.length;
  if (ratingsLength == 0) {
    return 0;
  }

  final double total = ratings.fold(
      0.0,
      (double sum, ProductRatingEntity rating) =>
          sum + rating.rating.toDouble());
  return total / ratingsLength;
}
