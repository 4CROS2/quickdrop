part of 'signup_cubit.dart';

class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => <Object>[];
}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserEntity user;

  const SignupSuccess({required this.user});

  @override
  List<Object> get props => <Object>[user];
}

class SignupFailure extends SignupState {
  final String message;

  const SignupFailure({required this.message});

  @override
  List<Object> get props => <Object>[message];
}
