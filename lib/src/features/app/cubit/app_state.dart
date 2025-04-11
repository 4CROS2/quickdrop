part of 'app_cubit.dart';

enum AppStatus { authenticated, unauthenticated, loading }

class AppState extends Equatable {
  const AppState({
    this.appStatus = AppStatus.loading,
    this.user = UserEntity.empty,
    this.themeMode = ThemeMode.system,
  });
  final UserEntity user;
  final AppStatus appStatus;
  final ThemeMode themeMode;

  AppState copyWith({
    UserEntity? user,
    AppStatus? appStatus,
    ThemeMode? themeMode,
  }) {
    return AppState(
      appStatus: appStatus ?? this.appStatus,
      user: user ?? this.user,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => <Object?>[appStatus, user, themeMode];
}
