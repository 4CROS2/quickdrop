part of 'my_locations_cubit.dart';

sealed class MyLocationsState extends Equatable {
  const MyLocationsState();

  @override
  List<Object> get props => <Object>[];
}

final class MyLocationsInitial extends MyLocationsState {}
