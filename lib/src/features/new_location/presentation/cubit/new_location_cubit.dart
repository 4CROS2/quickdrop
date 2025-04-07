import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/new_location/domain/usecase/new_location_usecase.dart';

part 'new_location_state.dart';

class NewLocationCubit extends Cubit<NewLocationState> {
  NewLocationCubit({
    required NewLocationUsecase usecase,
  })  : _usecase = usecase,
        super(NewLocationInitial());
  final NewLocationUsecase _usecase;

  void addNewLocation({required MyLocationsEntity location}) async {
    emit(Saving());
    try {
      await _usecase.addNewLocation(location: location);
      emit(SuccessSaving());
    } catch (e) {
      emit(
        ErrorSaving(
          message: e.toString(),
        ),
      );
    }
  }
}
