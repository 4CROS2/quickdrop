import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/extensions/capitalize.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});
  static Page<LoadingPage> page() => const MaterialPage<LoadingPage>(
        child: LoadingPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CupertinoActivityIndicator(),
            Text(
              'loading...'.capitalize(),
              style: const TextStyle(
                  fontFamily: 'RedHat',
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
