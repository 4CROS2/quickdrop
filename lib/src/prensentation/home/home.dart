import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/domain/repository/auth_repository.dart';
import 'package:quickdrop/src/injection/injection_container.dart' as di;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

  static Page<Home> page() => const MaterialPage<Home>(
        child: Home(),
      );
}

class _HomeState extends State<Home> {
  final AuthRepository data = di.sl<AuthRepository>();
  final FirebaseAuth user = di.sl<FirebaseAuth>();
  String? keyl = '';
  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    keyl = await user.currentUser!.getIdToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(keyl!),
          ),
          ElevatedButton(
            onPressed: () => data.logout(),
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
