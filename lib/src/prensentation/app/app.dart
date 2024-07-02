import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quickdrop/src/injection/injection_container.dart' as di;
import 'package:quickdrop/src/prensentation/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/routes/app_routes.dart';

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
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) =>
                          FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: FlowBuilder<AppStatus>(
                    key: Key(state.appStatus.name),
                    state: state.appStatus,
                    onGeneratePages: AppRoutes.generateRoute,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
