part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => <Object>[];
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  const LoginSuccess({required this.user});

  final UserEntity user;
  @override
  List<Object> get props => <Object>[user];
}

class LoginError extends LoginState {
  const LoginError({required this.message});
  final String message;
  @override
  List<Object> get props => <Object>[message];
}
