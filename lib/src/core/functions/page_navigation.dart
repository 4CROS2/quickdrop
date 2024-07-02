import 'package:flutter/cupertino.dart';

dynamic pushNavigator({required BuildContext context, required Widget page}) {
  Navigator.push(
    context,
    CupertinoPageRoute<Widget>(
      builder: (BuildContext context) => page,
    ),
  );
}

dynamic popNavigator({
  required BuildContext context,
}) {
  Navigator.pop(context);
}
