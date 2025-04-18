import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/router/go_router_refresh_stream.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/features/auth/presentation/login/login.dart';
import 'package:quickdrop/src/features/favorites/presentation/favorites.dart';
import 'package:quickdrop/src/features/financial_information/presentation/financial_information.dart';
import 'package:quickdrop/src/features/home/presentation/home.dart';
import 'package:quickdrop/src/features/language_page/language_page.dart';
import 'package:quickdrop/src/features/loading/loading.dart';
import 'package:quickdrop/src/features/my_locations/presentation/my_locations.dart';
import 'package:quickdrop/src/features/my_purchases/presentation/mypurchases.dart';
import 'package:quickdrop/src/features/navigationbar/presentation/app_navigation_bar.dart';
import 'package:quickdrop/src/features/productDetail/presentation/product.dart';
import 'package:quickdrop/src/features/productDetail/presentation/widgets/productHeader/widgets/full_screen_image.dart';
import 'package:quickdrop/src/features/profile/presentation/profile.dart';
import 'package:quickdrop/src/features/pruchase/presentation/purchase.dart';
import 'package:quickdrop/src/features/purchase_detail/presentation/purchase_detail.dart';
import 'package:quickdrop/src/features/search/presentation/search.dart';
import 'package:quickdrop/src/features/settings/presentation/settings.dart';
import 'package:quickdrop/src/features/user_menu/user_menu.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class AppRouter {
  final AppCubit _appCubit = sl<AppCubit>();
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
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
      // Rutas sin NavigationBar
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const LoadingPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) => const Login(),
      ),

      //Cambiar por statefullshellroute
      ShellRoute(
        parentNavigatorKey: _rootNavigatorKey,
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: const AppNavigationBar(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/home',
            name: 'home',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                const NoTransitionPage<Home>(
              child: Home(),
            ),
          ),
          GoRoute(
            path: '/favorites',
            name: 'favorites',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                const NoTransitionPage<Favorites>(
              child: Favorites(),
            ),
          ),
          GoRoute(
            path: '/searchpage',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                const NoTransitionPage<SearchPage>(
              child: SearchPage(),
            ),
          ),
          GoRoute(
            path: '/usermenu',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                const NoTransitionPage<UserMenu>(
              child: UserMenu(),
            ),
            routes: <RouteBase>[
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'mypurchases',
                builder: (BuildContext context, GoRouterState state) =>
                    const MyPurchases(),
              ),
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'settings',
                name: 'settings',
                builder: (BuildContext context, GoRouterState state) =>
                    const Settings(),
                routes: <RouteBase>[
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'languages',
                    name: 'language page',
                    builder: (BuildContext context, GoRouterState state) {
                      return const LanguagePage();
                    },
                  ),
                ],
              ),
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'profile',
                name: 'user account',
                builder: (BuildContext context, GoRouterState state) =>
                    const Profile(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/product/:productId',
        name: 'product',
        builder: (BuildContext context, GoRouterState state) {
          return ProductDetail(
            productId: state.pathParameters['productId']!,
            previewImage: state.uri.queryParameters['previewImage'] ?? '',
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'financialInformation',
            builder: (BuildContext context, GoRouterState state) {
              return FinancialInformation(
                productId: state.pathParameters['productId']!,
              );
            },
          ),
          GoRoute(
            path: 'purchase',
            name: 'purchase',
            builder: (BuildContext context, GoRouterState state) {
              return const Purchase();
            },
          ),
        ],
      ),

      GoRoute(
        path: '/fullScrenImage',
        name: 'fullScrenImage',
        builder: (BuildContext context, GoRouterState state) {
          final Map<String, dynamic> extra =
              state.extra as Map<String, dynamic>;
          final List<String> images =
              extra['images'] as List<String>? ?? <String>[];
          final int currentPage = extra['currentPage'] as int? ?? 0;
          return FullScreenImage(
            images: images,
            currentPage: currentPage,
          );
        },
      ),
      GoRoute(
        path: '/purchaseDetail/:purchaseId',
        builder: (BuildContext context, GoRouterState state) {
          return PurchaseDetail(
            orderId: state.pathParameters['purchaseId']!,
            sellerId: state.uri.queryParameters['sellerId']!,
          );
        },
      ),
      GoRoute(
        path: '/mylocations',
        builder: (BuildContext context, GoRouterState state) =>
            const MyLocations(),
      ),
    ],
  );
}
