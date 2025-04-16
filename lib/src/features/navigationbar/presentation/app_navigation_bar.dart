import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/features/navigationbar/domain/entity/destination_route.dart';
import 'package:quickdrop/src/features/navigationbar/presentation/widgets/destination.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  final List<DestinationRoute> destinations = <DestinationRoute>[
    DestinationRoute(
      page: 0,
      path: '/home',
      destinaton: Destination(
        icon: HugeIcons.strokeRoundedHome10,
        label: 'inicio',
      ),
    ),
    DestinationRoute(
      page: 1,
      path: '/favorites',
      destinaton: Destination(
        icon: HugeIcons.strokeRoundedFavourite,
        label: 'favoritos',
      ),
    ),
    DestinationRoute(
      page: 2,
      path: '/searchpage',
      destinaton: Destination(
        icon: HugeIcons.strokeRoundedSearch02,
        label: 'buscar',
      ),
    ),
    DestinationRoute(
      page: 3,
      path: '/cart',
      destinaton: Destination(
        icon: HugeIcons.strokeRoundedShoppingCart02,
        label: 'carrito',
        showBadge: true,
      ),
    ),
    DestinationRoute(
      page: 4,
      path: '/usermenu',
      destinaton: Destination(
        icon: HugeIcons.strokeRoundedUserAccount,
        label: 'cuenta',
      ),
    )
  ];

  int _getPage({required String location}) {
    final DestinationRoute? matchingRoute = destinations.firstWhereOrNull(
          (DestinationRoute dest) => location == dest.path,
        ) ??
        destinations.firstWhereOrNull(
          (DestinationRoute dest) => location.startsWith(dest.path),
        );
    return matchingRoute?.page ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    // Usamos GoRouterBuilder que detecta todos los cambios en la navegación
    return GoRouterBuilder(
      builder: (BuildContext context, GoRouterState state, Widget? child) {
        final String currentLocation = state.uri.path;
        final int currentPage = _getPage(location: currentLocation);

        return NavigationBar(
          selectedIndex: currentPage,
          onDestinationSelected: (int value) {
            if (value == currentPage) {
              return;
            }

            final String targetPath = destinations[value].path;

            if (value == 0 && currentLocation != '/home') {
              context.go('/home');
            } else if (currentLocation == '/home') {
              context.push(targetPath);
            } else {
              context.pushReplacement(targetPath);
            }
          },
          elevation: 20,
          destinations:
              destinations.map((DestinationRoute e) => e.destinaton).toList(),
        );
      },
    );
  }
}

// Implementación de GoRouterBuilder para eventos de navegación
class GoRouterBuilder extends StatefulWidget {
  final Widget Function(
      BuildContext context, GoRouterState state, Widget? child) builder;
  final Widget? child;

  const GoRouterBuilder({
    required this.builder,
    super.key,
    this.child,
  });

  @override
  State<GoRouterBuilder> createState() => _GoRouterBuilderState();
}

class _GoRouterBuilderState extends State<GoRouterBuilder>
    with WidgetsBindingObserver {
  late final GoRouter _router;
  late GoRouterState _state;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _router = GoRouter.of(context);
      _state = _router.state;
      _router.routerDelegate.addListener(_handleRouteChange);
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Actualiza cuando la app vuelve al primer plano
    if (state == AppLifecycleState.resumed) {
      setState(() {
        _state = GoRouter.of(context).state;
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  void _handleRouteChange() {
    final GoRouterState currentState = _router.state;
    if (_state.uri.path != currentState.uri.path) {
      setState(() {
        _state = currentState;
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _router.routerDelegate.removeListener(_handleRouteChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos el estado actual en cada build para capturar cambios inmediatos
    final GoRouterState currentState = GoRouter.of(context).state;
    return widget.builder(context, currentState, widget.child);
  }
}
