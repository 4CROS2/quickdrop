import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickdrop/src/features/home/domain/entity/rating_product.dart';

class ProductRatingModel extends ProductRatingEntity {
  const ProductRatingModel({
    required super.clientId,
    required super.comment,
    required super.createdAt,
    required super.rating,
  });

  static ProductRatingModel fromJson({required Map<String, dynamic> json}) {
    final Timestamp timestamp = json['created_at'] ?? Timestamp.now();
    final DateTime createdAt = timestamp.toDate();

    return ProductRatingModel(
      clientId: json['client_id'] ?? '',
      comment: json['comment'] ?? '',
      createdAt: createdAt,
      rating: json['rating'] ?? '',
    );
  }
}
