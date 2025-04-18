import 'package:quickdrop/src/features/cart/domain/entity/cart_product_entity.dart';

abstract interface class CartRepository {
  Stream<List<CartProductEntity>> getCartProducts();
}
