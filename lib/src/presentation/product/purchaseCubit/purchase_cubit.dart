import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  PurchaseCubit() : super(const PurchaseState());

  void addQuantity() {
    emit(
      state.copyWith(
        quantity: state.quantity + 1,
      ),
    );
  }

  void removeQuantity() {
    if (state.quantity > 1) {
      emit(
        state.copyWith(
          quantity: state.quantity - 1,
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
            quantity: quantityValue,
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
        quantity: 1,
      ),
    );
  }

  void buyProduct() {}

  void addToCart() {}
}
