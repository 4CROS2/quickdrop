import 'package:equatable/equatable.dart';

class SellersEntity extends Equatable {
  const SellersEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.sellerId,
    required this.isAvailable,
  });

  final String id;
  final String name;
  final String image;
  final String? sellerId;
  final bool isAvailable;

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        image,
        sellerId,
        isAvailable,
      ];
}
