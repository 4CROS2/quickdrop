import 'package:equatable/equatable.dart';
import 'package:quickdrop/src/domain/entity/products_entity.dart';
import 'package:quickdrop/src/domain/entity/sellers_entity.dart';

class HomeEntity extends Equatable {
  const HomeEntity({
    required this.products,
    required this.sellers,
  });

  final List<ProductsEntity> products;
  final List<SellersEntity> sellers;

  @override
  List<Object> get props => <Object>[
        products,
        sellers,
      ];
}
