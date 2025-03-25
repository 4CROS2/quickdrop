part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => <Object>[];
}

final class SearchInitial extends SearchState {}
