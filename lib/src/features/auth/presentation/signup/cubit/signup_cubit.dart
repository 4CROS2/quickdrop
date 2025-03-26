import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/features/auth/domain/usecase/auth_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({
    required AuthUseCase useCase,
  })  : _useCase = useCase,
        super(const SignupState());
  final AuthUseCase _useCase;

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String phone,
  }) async {
    try {
      emit(SignupLoading());
      await _useCase.signUp(
        email: email,
        password: password,
        name: name,
        lastName: lastName,
        phone: phone,
      );
      emit(
        SignupSuccess(),
      );
    } catch (e) {
      emit(
        SignupFailure(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> registerWithGoogle() async {
    try {
      emit(SignupLoading());
      await _useCase.registerWithGoogle();
      if (!isClosed) {
        emit(SignupSuccess());
      }
    } catch (e) {
      emit(
        SignupFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
