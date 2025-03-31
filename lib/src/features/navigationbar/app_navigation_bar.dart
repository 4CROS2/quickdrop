import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/navigationbar/domain/entity/destination.dart';
import 'package:quickdrop/src/features/navigationbar/domain/entity/destination_route.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({required this.currentLocation, super.key});
  final String currentLocation;

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int page = 0;
  final List<DestinationRoute> destinations = <DestinationRoute>[
    DestinationRoute(
      page: 0,
      path: '/home',
      destinaton: Destination(
        icon: HugeIcons.strokeRoundedHome10,
        label: 'home',
      ),
    ),
    DestinationRoute(
      page: 1,
      path: '/searchpage',
      destinaton: Destination(
        icon: HugeIcons.strokeRoundedSearch02,
        label: 'buscar',
      ),
    ),
  ];

  int _getPage({required String location}) {
    // Busca la primera coincidencia en la lista de destinos.
    final DestinationRoute matchingRoute = destinations.firstWhere(
      (DestinationRoute dest) => location.startsWith(dest.path),
      orElse: () => destinations.first,
    );
    return matchingRoute.page;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: Constants.secondaryColor.withValues(
        alpha: .2,
      ),
      surfaceTintColor: Constants.secondaryColor,
      selectedIndex: _getPage(location: widget.currentLocation),
      onDestinationSelected: (int value) {
        if (value != _getPage(location: widget.currentLocation)) {
          context.go(destinations[value].path);
        }
      },
      destinations: destinations
          .map(
            (DestinationRoute e) => e.destinaton,
          )
          .toList(),
    );
  }
}
