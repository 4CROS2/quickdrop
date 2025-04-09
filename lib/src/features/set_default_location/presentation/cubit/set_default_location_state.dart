part of 'set_default_location_cubit.dart';

class SetDefaultLocationState extends Equatable {
  const SetDefaultLocationState();

  @override
  List<Object> get props => <Object>[];
}

class Loading extends SetDefaultLocationState {}

class Error extends SetDefaultLocationState {
  const Error({required this.message});
  final String message;
}

class Success extends SetDefaultLocationState {}
