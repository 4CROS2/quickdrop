import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/presentation/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/presentation/favorites/favorites.dart';
import 'package:quickdrop/src/presentation/home/home.dart';
import 'package:quickdrop/src/presentation/loading/loading.dart';
import 'package:quickdrop/src/presentation/login/login.dart';
import 'package:quickdrop/src/presentation/product/product.dart';
import 'package:quickdrop/src/presentation/product/widgets/productHeader/widgets/full_screen_image.dart';
import 'package:quickdrop/src/presentation/pruchase/purchase.dart';
import 'package:quickdrop/src/router/go_router_refresh_stream.dart';

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
            MaterialPage<LoadingPage>(
          child: LoadingPage(),
        ),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage<Login>(
          child: Login(),
        ),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage<Home>(
          child: Home(),
        ),
      ),
      GoRoute(
          path: '/favorites',
          name: 'favorites',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CupertinoPage<Favorites>(
              child: Favorites(),
            );
          }),
      GoRoute(
        path: '/product/:productId',
        name: 'product',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CupertinoPage<Product>(
            child: Product(
              productId: state.pathParameters['productId']!,
              previewImage: state.uri.queryParameters['previewImage'] ?? '',
            ),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'purchase',
            name: 'purchase',
            pageBuilder: (BuildContext context, GoRouterState state) {
              final Map<String, dynamic> data =
                  state.extra as Map<String, dynamic>;
              return CupertinoPage<Purchase>(
                child: Purchase(productName: data['product_name'],),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/fullScrenImage',
        name: 'fullScrenImage',
        pageBuilder: (BuildContext context, GoRouterState state) {
          final Map<String, dynamic> extra =
              state.extra as Map<String, dynamic>;

          final List<String> images =
              extra['images'] as List<String>? ?? <String>[];
          final int currentPage = extra['currentPage'] as int? ?? 0;
          return MaterialPage<FullScreenImage>(
            fullscreenDialog: true,
            child: FullScreenImage(
              images: images,
              currentPage: currentPage,
            ),
          );
        },
      )
    ],
  );
}
