import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/router/go_router_refresh_stream.dart';
import 'package:quickdrop/src/features/profile/presentation/profile.dart';
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
import 'package:quickdrop/src/features/pruchase/presentation/purchase.dart';
import 'package:quickdrop/src/features/purchase_detail/presentation/purchase_detail.dart';
import 'package:quickdrop/src/features/search/presentation/search.dart';
import 'package:quickdrop/src/features/settings/presentation/settings.dart';
import 'package:quickdrop/src/features/user_menu/user_menu.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

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
      // Rutas sin NavigationBar
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => LoadingPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) => Login(),
      ),

      //Cambiar por statefullshellroute
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: AppNavigationBar(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (BuildContext context, GoRouterState state) => Home(),
          ),
          GoRoute(
            path: '/favorites',
            name: 'favorites',
            builder: (BuildContext context, GoRouterState state) => Favorites(),
          ),
          GoRoute(
            path: '/searchpage',
            builder: (BuildContext context, GoRouterState state) =>
                SearchPage(),
          ),
          GoRoute(
            path: '/usermenu',
            builder: (BuildContext context, GoRouterState state) => UserMenu(),
          )
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
              return Purchase();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/mypurchases',
        builder: (BuildContext context, GoRouterState state) => MyPurchases(),
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
        builder: (BuildContext context, GoRouterState state) => MyLocations(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (BuildContext context, GoRouterState state) => Settings(),
        routes: <RouteBase>[
          GoRoute(
            path: 'languages',
            name: 'language page',
            builder: (BuildContext context, GoRouterState state) {
              return LanguagePage();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/profile',
        name: 'user account',
        builder: (BuildContext context, GoRouterState state) => Profile(),
      )
    ],
  );
}
