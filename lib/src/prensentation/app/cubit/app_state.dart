part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    this.user = const UserEntity(email: '', id: ''),
  });
  final UserEntity user;

  AppState copyWith({
    UserEntity? user,
  }) {
    return AppState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => <Object?>[user];
}
