part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => <Object>[];
}

final class LoginInitial extends LoginState {}
