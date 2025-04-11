import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quickdrop/src/core/localization/app_localizations.dart';
import 'package:quickdrop/src/core/router/app_router.dart';
import 'package:quickdrop/src/core/theme/app_dark_theme.dart';
import 'package:quickdrop/src/core/theme/app_light_theme.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart' as di;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
    AppLightTheme.initialize(context);
    AppDarkTheme.initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (BuildContext context) => di.sl<AppCubit>(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (BuildContext context, AppState state) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: MaterialApp.router(
              title: 'Quickdrop',
              theme: AppLightTheme.instance,
              darkTheme: AppDarkTheme.instance,
              themeMode: state.themeMode,
              locale: Locale(
                View.of(context).platformDispatcher.locale.languageCode,
              ),
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: const <LocalizationsDelegate<Object>>[
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routerConfig: _appRouter.router,
            ),
          );
        },
      ),
    );
  }
}
