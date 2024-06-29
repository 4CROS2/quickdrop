part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => <Object>[];
}

final class SignupInitial extends SignupState {}
