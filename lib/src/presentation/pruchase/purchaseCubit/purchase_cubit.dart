import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/domain/usecase/purshase_usecase.dart';

part 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  PurchaseCubit({required PurchaseUsecase usecase})
      : _usecase = usecase,
        super(const PurchaseState());
  final PurchaseUsecase _usecase;

  void setProductData({
    required String sellerId,
    required String productId,
    required String buyerId,
    required int currentPrice,
  }) {
    emit(
      state.copyWith(
        product: state.product.copyWith(
          buyerId: buyerId,
          sellerId: sellerId,
          productId: productId,
          currentPrice: currentPrice
        ),
      ),
    );
  }

  void addQuantity() {
    emit(
      state.copyWith(
        product: state.product.copyWith(
          quantity: state.product.quantity + 1,
        ),
      ),
    );
  }

  void removeQuantity() {
    if (state.product.quantity > 1) {
      emit(
        state.copyWith(
          product: state.product.copyWith(
            quantity: state.product.quantity - 1,
          ),
        ),
      );
    }
  }

  void setQuantity({required String value}) {
    final String validInput =
        value.isEmpty ? '1' : value.replaceAll(RegExp(r'[^0-9]'), '');
    try {
      final int quantityValue = int.parse(validInput);
      if (quantityValue >= 1) {
        emit(
          state.copyWith(
            product: state.product.copyWith(
              quantity: quantityValue,
            ),
          ),
        );
      } else {
        emitInitialQuantity();
      }
    } catch (e) {
      emitInitialQuantity();
    }
  }

  void emitInitialQuantity() {
    emit(
      state.copyWith(
        product: state.product.copyWith(
          quantity: 1,
        ),
      ),
    );
  }

  void buyProduct() async {
    await _usecase.purchaseProduct(
      product: state.product,
    );
  }

  void addToCart() {}
}
