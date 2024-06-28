import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'QuickDrop',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Questrial',
              fontSize: 60,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Encuentra, Compra, Recibe',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Redhat',
                fontSize: 16,
                fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}
