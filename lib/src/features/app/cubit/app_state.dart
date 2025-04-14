part of 'app_cubit.dart';

enum AppStatus { authenticated, unauthenticated, loading }

class AppState extends Equatable {
  const AppState({
    this.appStatus = AppStatus.loading,
    this.user = UserEntity.empty,
    this.themeMode = ThemeMode.system,
    this.locale = const Locale('en'),
  });
  final UserEntity user;
  final AppStatus appStatus;
  final ThemeMode themeMode;
  final Locale locale;

  AppState copyWith({
    UserEntity? user,
    AppStatus? appStatus,
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return AppState(
      appStatus: appStatus ?? this.appStatus,
      user: user ?? this.user,
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        appStatus,
        user,
        themeMode,
        locale,
      ];
}
