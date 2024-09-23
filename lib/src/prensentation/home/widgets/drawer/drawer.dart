import 'package:flutter/material.dart';
import 'package:quickdrop/src/domain/usecase/auth_usecase.dart';
import 'package:quickdrop/src/injection/injection_container.dart';

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
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _authUseCase.logout();
              },
              child: const Text('exit'),
            )
          ],
        ),
      ),
    );
  }
}
