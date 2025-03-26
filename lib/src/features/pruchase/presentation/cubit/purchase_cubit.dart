import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/features/pruchase/domain/usecase/purshase_usecase.dart';

part 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  PurchaseCubit({required PurchaseUsecase usecase})
      : _usecase = usecase,
        super(const PurchaseState());
  final PurchaseUsecase _usecase;

  void setProductData({
    required String productName,
    required String sellerId,
    required String productId,
    required String buyerId,
    required int currentPrice,
    required String imagePath,
  }) async {
    emit(
      state.copyWith(
        product: state.product.copyWith(
          productName: productName,
          buyerId: buyerId,
          sellerId: sellerId,
          productId: productId,
          currentPrice: currentPrice,
          imagePath: imagePath,
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

  void setDeliveryMethod({required int value}) {
    if (value != state.product.deliverymethod.index) {
      emit(
        state.copyWith(
          product: state.product.copyWith(
            deliverymethod: Deliverymethod.values[value],
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          product: state.product.copyWith(
            deliverymethod: Deliverymethod.nullValue,
          ),
        ),
      );
    }
  }

  void setAddress({required GeoPoint address, required String description}) {
    emit(
      state.copyWith(
        product: state.product.copyWith(
          address: OrderAddressEntity(
            location: address,
            locationDescription: description,
          ),
        ),
      ),
    );
  }

  bool deliveryState() {
    return state.purchaseStatus == PurchaseStatus.loading ||
        state.purchaseStatus == PurchaseStatus.success ||
        state.purchaseStatus == PurchaseStatus.error;
  }

  Future<void> buyProduct() async {
    try {
      if (state.product.description.isEmpty) {
        throw Exception('Por favor ingresa una dirección de entrega');
      }
      if (state.product.deliverymethod != Deliverymethod.nullValue) {
        emit(
          state.copyWith(
            purchaseStatus: PurchaseStatus.loading,
            message: '',
          ),
        );
        final String response = await _usecase.purchaseProduct(
          product: state.product,
        );
        emit(
          state.copyWith(
              purchaseStatus: PurchaseStatus.success, purchaseId: response),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          purchaseStatus: PurchaseStatus.error,
          message: e.toString(),
        ),
      );
      Future<void>.delayed(const Duration(seconds: 3), () {
        emit(
          state.copyWith(
            purchaseStatus: PurchaseStatus.initial,
          ),
        );
      });
    }
  }

  void addToCart() {}
}
