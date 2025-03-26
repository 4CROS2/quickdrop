import 'package:equatable/equatable.dart';

class ProductRatingEntity extends Equatable {
  const ProductRatingEntity({
    required this.clientId,
    required this.comment,
    required this.createdAt,
    required this.rating,
  });
  final String clientId;
  final String comment;
  final DateTime createdAt;
  final double rating;

  @override
  List<Object?> get props => <Object?>[
        clientId,
        comment,
        createdAt,
        rating,
      ];
}
