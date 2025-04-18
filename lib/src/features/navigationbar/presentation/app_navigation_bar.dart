import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/features/navigationbar/domain/entity/destination_route.dart';
import 'package:quickdrop/src/features/navigationbar/presentation/widgets/destination.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({
    super.key,
  });

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
    final DestinationRoute matchingRoute = destinations.firstWhere(
      (DestinationRoute dest) => location.startsWith(dest.path),
      orElse: () => destinations.first,
    );
    return matchingRoute.page;
  }

  @override
  Widget build(BuildContext context) {
    final String currentLocation = GoRouter.of(context).state.matchedLocation;
    final int currentPage = _getPage(location: currentLocation);
    return NavigationBar(
      selectedIndex: currentPage,
      onDestinationSelected: (int value) {
        if (value == currentPage) {
          return;
        }

        if (value == 0) {
          context.pop();
        } else if (currentLocation == '/home') {
          context.push(destinations[value].path);
        } else {
          context.pushReplacement(destinations[value].path);
        }
      },
      elevation: 20,
      destinations: destinations
          .map(
            (DestinationRoute e) => e.destinaton,
          )
          .toList(),
    );
  }
}
