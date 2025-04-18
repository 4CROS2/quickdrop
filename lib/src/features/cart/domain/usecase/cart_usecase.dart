import 'package:quickdrop/src/features/cart/domain/entity/cart_product_entity.dart';
import 'package:quickdrop/src/features/cart/domain/repository/cart_repository.dart';

class CartUsecase {
  CartUsecase({
    required CartRepository repository,
  }) : _repository = repository;
  final CartRepository _repository;
  Stream<List<CartProductEntity>> get getCartProducts =>
      _repository.getCartProducts();
}
