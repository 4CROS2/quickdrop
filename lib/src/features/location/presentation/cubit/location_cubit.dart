import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickdrop/src/features/location/domain/entity/location_entity.dart';
import 'package:quickdrop/src/features/location/domain/usecase/location_usecase.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({
    required LocationUsecase usecase,
  })  : _usecase = usecase,
        super(Loading());

  final LocationUsecase _usecase;

  Future<void> getCurrentLocation() async {
    final LocationEntity response = await _usecase.getCurrentLocation();
    print(response);
  }
}
