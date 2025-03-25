import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/feature/auth/domain/entity/user_entity.dart';
import 'package:quickdrop/src/feature/auth/domain/usecase/auth_usecase.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required AuthUseCase authUseCase,
  })  : _authUseCase = authUseCase,
        super(const AppState()) {
    _authSubscription();
  }
  final AuthUseCase _authUseCase;
  StreamSubscription<UserEntity>? _subscription;
  void _authSubscription() {
    _emitLoadingState();
    _subscription = _authUseCase.userStatus().listen(
          (UserEntity deliveryAgent) => _onDeliveryAgentUpdated(
            user: deliveryAgent,
          ),
          onError: _onError,
        );
  }

  void _emitLoadingState() {
    emit(state.copyWith(appStatus: AppStatus.loading));
  }

  void _emitAuthenticatedState({required UserEntity user}) {
    emit(
      state.copyWith(
        user: user,
        appStatus: AppStatus.authenticated,
      ),
    );
  }

  void _emitUnauthenticatedState() {
    emit(
      state.copyWith(
        user: UserEntity.empty,
        appStatus: AppStatus.unauthenticated,
      ),
    );
  }

  void _onDeliveryAgentUpdated({required UserEntity user}) {
    if (user.id.isNotEmpty) {
      _emitAuthenticatedState(user: user);
    } else {
      _emitUnauthenticatedState();
    }
  }

  // ignore: always_specify_types
  void _onError(error) {
    _emitUnauthenticatedState();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
