import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/features/current_location_button/domain/entity/current_location_entity.dart';
import 'package:quickdrop/src/features/current_location_button/domain/usecase/current_location_usecase.dart';

part 'current_location_button_state.dart';

class CurrentLocationButtonCubit extends Cubit<CurrentLocationButtonState> {
  CurrentLocationButtonCubit({
    required CurrentLocationUsecase usecase,
  })  : _usecase = usecase,
        super(CurrentLocationButtonState()) {
    _getCurrentDefaultLocation();
  }
  final CurrentLocationUsecase _usecase;

  StreamSubscription<CurrentLocationEntity>? _streamSubscription;

  void _getCurrentDefaultLocation() {
    _onLoading();
    _streamSubscription = _usecase.getCurrentLocation.listen(
      _onSuccess,
      onError: _onError,
    );
  }

  void _onSuccess(CurrentLocationEntity entity) {
    emit(
      Success(
        locationEntity: entity,
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

  void _onLoading() {
    emit(Loading());
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
