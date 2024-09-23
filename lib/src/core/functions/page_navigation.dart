import 'package:flutter/cupertino.dart';

class PageNavigation {
  static void pushNavigator(BuildContext context, {required Widget page}) {
    Navigator.push(
      context,
      CupertinoPageRoute<Widget>(
        builder: (BuildContext context) => page,
      ),
    );
  }

  static dynamic popNavigator(
    BuildContext context,
  ) {
    Navigator.pop(context);
  }
}
