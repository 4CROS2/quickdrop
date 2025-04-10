part of 'current_location_button_cubit.dart';

class CurrentLocationButtonState extends Equatable {
  const CurrentLocationButtonState();

  @override
  List<Object> get props => <Object>[];
}

class Loading extends CurrentLocationButtonState {}

class Error extends CurrentLocationButtonState {
  const Error({required this.message});
  final String message;
}

class Success extends CurrentLocationButtonState {
  const Success({required this.locationEntity});

  final CurrentLocationEntity locationEntity;

  @override
  List<Object> get props => <Object>[locationEntity];
}
