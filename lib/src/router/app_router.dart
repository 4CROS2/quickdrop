import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/prensentation/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/prensentation/favorites/favorites.dart';
import 'package:quickdrop/src/prensentation/home/home.dart';
import 'package:quickdrop/src/prensentation/loading/loading.dart';
import 'package:quickdrop/src/prensentation/login/login.dart';
import 'package:quickdrop/src/prensentation/product/product.dart';
import 'package:quickdrop/src/router/fade_transition_builder.dart';
import 'package:quickdrop/src/router/go_router_refresh_stream.dart';
import 'package:quickdrop/src/router/slide_transition_router.dart';

class AppRouter {
  final AppCubit _appCubit = sl<AppCubit>();
  late final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(
      stream: _appCubit.stream,
    ),
    redirect: (BuildContext context, GoRouterState state) {
      final AppStatus appStatus = _appCubit.state.appStatus;

      if (appStatus == AppStatus.authenticated &&
          state.matchedLocation == '/') {
        return '/home';
      }
      if (appStatus == AppStatus.authenticated &&
          state.matchedLocation == '/login') {
        return '/home';
      }

      if (appStatus == AppStatus.unauthenticated &&
          state.matchedLocation != '/login') {
        return '/login';
      }
      if (appStatus == AppStatus.loading && state.matchedLocation == '/') {
        return '/';
      }

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            CustomTransitionPage<LoadingPage>(
          child: LoadingPage(),
          transitionsBuilder: fadeTransitionBuilder,
          transitionDuration: Constants.animationTransition,
        ),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            CustomTransitionPage<Login>(
          child: Login(),
          transitionsBuilder: fadeTransitionBuilder,
          transitionDuration: Constants.animationTransition,
        ),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            CustomTransitionPage<Home>(
          child: Home(),
          transitionsBuilder: fadeTransitionBuilder,
          transitionDuration: Constants.animationTransition,
        ),
      ),
      GoRoute(
          path: '/favorites',
          name: 'favorites',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage<Home>(
              child: Favorites(),
              transitionsBuilder: slideTransitionBuilder,
              transitionDuration: Constants.animationTransition,
            );
          }),
      GoRoute(
        path: '/product/:productId',
        name: 'product',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            CustomTransitionPage<Home>(
          child: Product(
            productId: state.pathParameters['productId']!,
          ),
          transitionsBuilder: fadeTransitionBuilder,
          transitionDuration: Constants.animationTransition,
        ),
      )
    ],
  );
}
