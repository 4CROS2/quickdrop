import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/functions/page_navigation.dart';
import 'package:quickdrop/src/domain/usecase/auth_usecase.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/prensentation/favorites/favorites.dart';
import 'package:quickdrop/src/prensentation/home/widgets/drawer/widgets/custom_drawer_header.dart';

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
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CustomDrawerHeader(),
              ElevatedButton(
                onPressed: () {
                  _authUseCase.logout();
                },
                child: const Text('exit'),
              ),
              ElevatedButton(
                onPressed: () {
                  PageNavigation.popNavigator(context);
                  PageNavigation.pushNavigator(
                    context,
                    page: Favorites(),
                  );
                },
                child: const Text('favorites'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
