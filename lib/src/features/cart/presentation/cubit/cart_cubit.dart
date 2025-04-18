import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/features/cart/domain/entity/cart_product_entity.dart';
import 'package:quickdrop/src/features/cart/domain/usecase/cart_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required CartUsecase usecase})
      : _usecase = usecase,
        super(Loading()) {
    _getProducts();
  }

  final CartUsecase _usecase;

  StreamSubscription<List<CartProductEntity>>? _subscription;

  void _getProducts() {
    _subscription = _usecase.getCartProducts.listen(
      _onSuccess,
      onError: _onError,
    );
  }

  void _onSuccess(List<CartProductEntity> products) {
    emit(
      Success(
        products: products,
      ),
    );
  }

  void _onError(Object error) {
    emit(
      Error(
        message: error.toString(),
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
