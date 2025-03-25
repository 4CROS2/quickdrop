import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/router/go_router_refresh_stream.dart';
import 'package:quickdrop/src/feature/home/presentation/home.dart';
import 'package:quickdrop/src/feature/productDetail/presentation/product.dart';
import 'package:quickdrop/src/feature/productDetail/presentation/widgets/productHeader/widgets/full_screen_image.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/presentation/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/presentation/favorites/favorites.dart';
import 'package:quickdrop/src/presentation/financial_information/financial_information.dart';
import 'package:quickdrop/src/presentation/loading/loading.dart';
import 'package:quickdrop/src/feature/auth/presentation/login/login.dart';
import 'package:quickdrop/src/presentation/my_purchases/mypurchases.dart';
import 'package:quickdrop/src/presentation/pruchase/purchase.dart';
import 'package:quickdrop/src/presentation/purchase_detail/purchase_detail.dart';
import 'package:quickdrop/src/presentation/search/search.dart';

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
        builder: (BuildContext context, GoRouterState state) => LoadingPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) => Login(),
      ),
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
        path: '/myPurchases',
        builder: (BuildContext context, GoRouterState state) => MyPurchases(),
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
        path: '/searchpage',
        builder: (BuildContext context, GoRouterState state) => Search(),
      ),
    ],
  );
}
