import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';

class LoadingStatus extends StatelessWidget {
  const LoadingStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator.adaptive(),
          Text(
            'loading...'.capitalize(),
            style: const TextStyle(
              fontFamily: 'RedHat',
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
