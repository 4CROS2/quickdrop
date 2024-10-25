import 'package:flutter/material.dart';
import 'package:quickdrop/src/domain/usecase/auth_usecase.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/prensentation/favorites/favorites.dart';
import 'package:quickdrop/src/prensentation/home/widgets/drawer/widgets/custom_drawer_header/custom_drawer_header.dart';
import 'package:quickdrop/src/prensentation/home/widgets/drawer/widgets/section/section_tile.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  late final AuthUseCase _authUseCase;

  @override
  void initState() {
    super.initState();

    _authUseCase = sl<AuthUseCase>();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CustomDrawerHeader(),
            SectionTile(
              page: Favorites(),
              icon: Icons.favorite_outline_rounded,
              label: 'mis favoritos',
            ),
            SectionTile(
              icon: Icons.shopping_bag_outlined,
              label: 'mis compras',
            ),
            SectionTile(
              icon: Icons.schedule_rounded,
              label: 'historial',
            ),
            ElevatedButton(
              onPressed: () {
                _authUseCase.logout();
              },
              child: const Text('exit'),
            ),
            
          ],
        ),
      ),
    );
  }
}
