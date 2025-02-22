import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/domain/usecase/purshase_usecase.dart';

part 'purchase_detail_state.dart';

class PurchaseDetailCubit extends Cubit<PurchaseDetailState> {
  PurchaseDetailCubit({
    required PurchaseUsecase usecase,
  })  : _usecase = usecase,
        super(PurchaseDetailInitial());

  final PurchaseUsecase _usecase;
}
