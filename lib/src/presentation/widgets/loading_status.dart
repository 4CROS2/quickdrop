import 'package:extensions/extensions.dart';
import 'package:flutter/cupertino.dart';

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
    );
  }
}
