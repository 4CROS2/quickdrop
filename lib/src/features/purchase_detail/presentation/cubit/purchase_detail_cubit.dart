import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/features/my_purchases/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/features/purchase_detail/domain/usecase/purchase_detail_usecase.dart';

part 'purchase_detail_state.dart';

class PurchaseDetailCubit extends Cubit<PurchaseDetailState> {
  PurchaseDetailCubit({
    required PurchaseDetailUsecase usecase,
  })  : _usecase = usecase,
        super(PurchaseDetailInitial());

  final PurchaseDetailUsecase _usecase;

  StreamSubscription<PurchaseEntity>? _purchaseDetailSubscription;

  void getPurchaseDetail({
    required String purchaseId,
    required String sellerId,
  }) async {
    _onLoading();
    _purchaseDetailSubscription = _usecase
        .getPurchaseDetail(
          orderId: purchaseId,
          sellerId: sellerId,
        )
        .listen(
          _onSuccess,
          onError: _onError,
        );
  }

  void _onSuccess(PurchaseEntity purchase) {
    emit(
      Success(purchaseDetail: purchase),
    );
  }

  void _onError(Object message) {
    emit(
      Error(
        message: message.toString(),
      ),
    );
  }

  void _onLoading() {
    emit(
      Loading(),
    );
  }

  @override
  Future<void> close() {
    _purchaseDetailSubscription?.cancel();
    return super.close();
  }
}
