import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        buildWhen: (AppState previous, AppState current) {
          return previous.user.id != current.user.id;
        },
        builder: (BuildContext context, AppState state) {
          return MaterialApp(
            title: 'Quickdrop',
            onGenerateRoute: AppRoutes.generateRoute,
            initialRoute:
                state.user.email.isEmpty ? AppRoutes.login : AppRoutes.home,
          );
        },
      ),
    );
  }
}
