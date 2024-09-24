import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/injection/injection_container.dart' as di;
import 'package:quickdrop/src/prensentation/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/prensentation/home/home.dart';
import 'package:quickdrop/src/prensentation/loading/loading.dart';
import 'package:quickdrop/src/prensentation/login/login.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (BuildContext context) => di.sl<AppCubit>(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (BuildContext context, AppState state) {
          return MediaQuery(
            data: MediaQueryData.fromView(View.of(context)).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: MaterialApp(
              title: 'Quickdrop',
              theme: ThemeData(
                colorSchemeSeed: Constants.primaryColor,
                fontFamily: 'RedHat',
              ),
              darkTheme: ThemeData.dark(),
              themeMode: ThemeMode.light,
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
              home: Scaffold(
                body: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: switch (state.appStatus) {
                    AppStatus.authenticated => const Home(),
                    AppStatus.unauthenticated => const Login(),
                    AppStatus.loading => const LoadingPage()
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
