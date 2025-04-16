import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/features/home/domain/entity/home_entity.dart';
import 'package:quickdrop/src/features/home/domain/usecase/home_data_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required HomeDataUsecase usecase,
  })  : _usecase = usecase,
        super(const HomeState());

  final HomeDataUsecase _usecase;

  // Método para obtener los datos de inicio
  Future<void> getHomeData() async {
    emit(LoadingHomeData());
    try {
      final HomeEntity response = await _usecase.products();
      emit(
        SuccessHomeData(home: response),
      );
    } catch (e) {
      emit(
        ErrorGettingHomeData(
          message: e.toString(),
        ),
      );
    }
  }
}
