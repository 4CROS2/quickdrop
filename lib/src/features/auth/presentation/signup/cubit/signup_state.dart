part of 'signup_cubit.dart';

class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => <Object>[];
}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupFailure extends SignupState {
  final String message;

  const SignupFailure({required this.message});

  @override
  List<Object> get props => <Object>[message];
}
