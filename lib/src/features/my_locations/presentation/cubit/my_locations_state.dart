part of 'my_locations_cubit.dart';

class MyLocationsState extends Equatable {
  const MyLocationsState();

  @override
  List<Object> get props => <Object>[];
}

class Loading extends MyLocationsState {}

class Error extends MyLocationsState {
  const Error({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[message];
}

class Success extends MyLocationsState {
  const Success({required this.locations});
  final List<MyLocationsEntity> locations;

  @override
  List<Object> get props => <Object>[locations];
}
