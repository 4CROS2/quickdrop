import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/features/set_default_location/domain/usecase/set_default_location_usecase.dart';

part 'set_default_location_state.dart';

class SetDefaultLocationCubit extends Cubit<SetDefaultLocationState> {
  SetDefaultLocationCubit({
    required SetDefaultLocationUsecase usecase,
  })  : _usecase = usecase,
        super(SetDefaultLocationState());
  final SetDefaultLocationUsecase _usecase;

  void setDefaultLocation({required String locationId}) async {
    try {
      emit(Loading());
      await _usecase.setDefaultLocation(
        locationId: locationId,
      );
      emit(Success());
    } catch (e) {
      emit(
        Error(
          message: e.toString(),
        ),
      );
    }
  }
}
