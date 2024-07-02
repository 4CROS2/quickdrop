import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/domain/entity/user_entity.dart';
import 'package:quickdrop/src/domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthUseCase useCase})
      : _useCase = useCase,
        super(const LoginState());
  final AuthUseCase _useCase;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoading());
      final UserEntity user = await _useCase.login(
        email: email,
        password: password,
      );
      emit(
        LoginSuccess(user: user),
      );
    } catch (e) {
      emit(LoginError(message: e as String));
    }
  }
}
