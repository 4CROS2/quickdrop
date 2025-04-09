part of 'new_location_cubit.dart';

sealed class NewLocationState extends Equatable {
  const NewLocationState();

  @override
  List<Object> get props => <Object>[];
}

final class NewLocationInitial extends NewLocationState {}

final class Saving extends NewLocationState {}

final class ErrorSaving extends NewLocationState {
  const ErrorSaving({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[message];
}

final class SuccessSaving extends NewLocationState {}
