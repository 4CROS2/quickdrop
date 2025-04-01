part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => <Object>[];
}

final class SearchInitial extends SearchState {
  const SearchInitial({
    this.searchHistory = const <String>[],
  });
  final List<String> searchHistory;

  @override
  List<Object> get props => <Object>[searchHistory];
}

final class Loading extends SearchState {}

final class Success extends SearchState {
  const Success({required this.results});

  final List<String> results;

  @override
  List<Object> get props => <Object>[results];
}

final class Error extends SearchState {
  const Error({required this.message});
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
