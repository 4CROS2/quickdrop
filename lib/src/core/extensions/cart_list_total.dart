import 'package:quickdrop/src/features/cart/domain/entity/cart_product_entity.dart';

extension CartListTotal on List<CartProductEntity> {
  int grandTotalCents() => fold(
        0,
        (int sum, CartProductEntity p) => sum + p.total,
      );
}
