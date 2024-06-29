import 'package:flutter/material.dart';
import 'package:quickdrop/src/prensentation/home/home.dart';
import 'package:quickdrop/src/prensentation/login/login.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute<Login>(
          builder: (BuildContext context) => const Login(),
        );
      default:
        return MaterialPageRoute<Home>(
          builder: (BuildContext context) => const Home(),
        );
    }
  }
}
