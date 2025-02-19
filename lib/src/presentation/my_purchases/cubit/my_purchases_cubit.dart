import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/domain/entity/my_purchases_entity.dart';
import 'package:quickdrop/src/domain/usecase/my_purchases_usecase.dart';

part 'my_purchases_state.dart';

class MyPurchasesCubit extends Cubit<MyPurchasesState> {
  MyPurchasesCubit({
    required MyPurchasesUsecase usecase,
  })  : _usecase = usecase,
        super(Loading());

  final MyPurchasesUsecase _usecase;

  Future<void> getMyPurchases() async {
    emit(Loading());
    try {
      final List<MyPurchasesEntity> purchases = await _usecase.getMyPurchases();

      if (!isClosed) {
        emit(
          Success(
            purchases: purchases,
          ),
        );
      }
    } catch (e) {
      emit(
        Error(
          message: e.toString(),
        ),
      );
    }
  }
}
