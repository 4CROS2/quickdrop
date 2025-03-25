import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/localization/app_localizations.dart';
import 'package:quickdrop/src/feature/auth/domain/usecase/auth_usecase.dart';

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
      await _useCase.login(
        email: email,
        password: password,
      );
      emit(
        LoginSuccess(),
      );
    } catch (e) {
      emit(LoginError(message: e as String));
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      emit(LoginLoading());
      await _useCase.googleSignin();
    } catch (e) {
      if (!isClosed) {
        emit(
          LoginError(
            message: e.toString(),
          ),
        );
      }
    }
  }

  String localizationResponse({
    required AppLocalizations localizations,
    required String code,
  }) {
    switch (code) {
      case '500':
        return localizations.invalidCredential;
      case '501':
        return localizations.invalidEmail;
      case '502':
        return localizations.userDisabled;
      case '503':
        return localizations.userNotFound;
      case '504':
        return localizations.wrongPassword;
      default:
        return localizations.unknownError;
    }
  }
}
