import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/my_locations/domain/usecase/my_locations_usecase.dart';

part 'my_locations_state.dart';

class MyLocationsCubit extends Cubit<MyLocationsState> {
  MyLocationsCubit({
    required MyLocationsUsecase usecase,
  })  : _usecase = usecase,
        super(MyLocationsState()) {
    getLocations();
  }

  final MyLocationsUsecase _usecase;
  StreamSubscription<List<MyLocationsEntity>>? _subscription;

  /// Fetch locations from the repository
  /// and emit the corresponding state.
  void getLocations() {
    _onLoading();
    _subscription = _usecase.getLocations().listen(
          _onSuccess,
          onError: _onError,
        );
  }

  void _onLoading() {
    emit(
      Loading(),
    );
  }

  void _onSuccess(List<MyLocationsEntity> locations) {
    emit(
      Success(locations: locations),
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
