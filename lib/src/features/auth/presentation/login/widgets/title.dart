import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/localization/app_localizations.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'title',
      transitionOnUserGestures: true,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Text(
                'QuickDrop',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Questrial',
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.slogan.capitalize(),
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Redhat',
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
