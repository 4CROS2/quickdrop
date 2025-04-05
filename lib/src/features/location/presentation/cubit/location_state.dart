part of 'location_cubit.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => <Object>[];
}

class Loading extends LocationState {}

class Error extends LocationState {
  const Error({required this.message});

  final String message;
}

class Success extends LocationState {
  const Success({required this.location});

  final LocationEntity location;

  @override
  List<Object> get props => <Object>[location];
}
