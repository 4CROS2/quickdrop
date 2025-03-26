import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/features/my_purchases/domain/entity/my_purchases_entity.dart';
import 'package:quickdrop/src/features/my_purchases/domain/usecase/my_purchases_usecase.dart';

part 'my_purchases_state.dart';

class MyPurchasesCubit extends Cubit<MyPurchasesState> {
  MyPurchasesCubit({
    required MyPurchasesUsecase usecase,
  })  : _usecase = usecase,
        super(Loading());

  final MyPurchasesUsecase _usecase;

  late StreamSubscription<List<MyPurchasesEntity>> _purchasesStream;

  Future<void> getMyPurchases() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    _onLoading();
    _purchasesStream = _usecase.getMyPurchases.listen(
      _onSuccess,
      onError: _onError,
    );
  }

  void _onSuccess(List<MyPurchasesEntity> purchases) {
    if (!isClosed) {
      emit(
        Success(
          purchases: purchases,
        ),
      );
    }
  }

  void _onError(Object message) {
    emit(
      Error(
        message: message.toString(),
      ),
    );
  }

  void _onLoading() {
    emit(Loading());
  }

  @override
  Future<void> close() {
    _purchasesStream.cancel();
    return super.close();
  }
}
