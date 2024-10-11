part of 'favorites_cubit.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => <Object>[];
}

final class FavoritesInitial extends FavoritesState {}
