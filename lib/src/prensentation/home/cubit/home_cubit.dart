import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/domain/entity/home_products.dart';
import 'package:quickdrop/src/domain/usecase/home_data_usecase.dart';
import 'package:quickdrop/src/injection/injection_container.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required HomeDataUsecase usecase,
  })  : _usecase = usecase,
        super(HomeState());

  final HomeDataUsecase _usecase;
  final FirebaseAuth _firebaseAuth = sl<FirebaseAuth>();

  // Método para obtener el token del usuario autenticado
  Future<String?> getString() async {
    return await _firebaseAuth.currentUser?.getIdToken();
  }

  // Método para obtener los datos de inicio
  Future<void> getHomeData() async {
    emit(LoadingHomeData());
    try {
      final String? userToken = await getString();

      if (userToken != null) {
        final List<HomeProductsEntity> response = await _usecase.products(
          userToken: userToken,
        );
        emit(
          SuccessHomeData(products: response),
        );
      } else {
        emit(
          ErrorGettingHomeData(
            message: 'error al obtener los datos',
          ),
        );
      }
    } catch (e) {
      emit(
        ErrorGettingHomeData(
          message: e.toString(),
        ),
      );
    }
  }
}
