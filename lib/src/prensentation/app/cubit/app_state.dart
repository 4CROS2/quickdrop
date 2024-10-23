part of 'app_cubit.dart';

enum AppStatus { authenticated, unauthenticated, loading }

class AppState extends Equatable {
  const AppState({
    this.appStatus = AppStatus.loading,
    this.user = UserEntity.empty,
  });
  final UserEntity user;
  final AppStatus appStatus;

  AppState copyWith({
    UserEntity? user,
    AppStatus? appStatus,
  }) {
    return AppState(
      appStatus: appStatus ?? this.appStatus,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => <Object?>[appStatus, user];
}
