import 'package:flutter/cupertino.dart';

class PageNavigation {
  static void _navigate(
    BuildContext context, {
    required Widget page,
    bool isReplacement = false,
  }) {
    final CupertinoPageRoute<Widget> route = CupertinoPageRoute<Widget>(
      builder: (BuildContext context) => page,
    );

    if (isReplacement) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }

  static void pushNavigator(BuildContext context, {required Widget page}) {
    _navigate(context, page: page);
  }

  static void popNavigator(BuildContext context) {
    Navigator.pop(context);
  }

  static void pushAndReplacement(BuildContext context, {required Widget page}) {
    _navigate(context, page: page, isReplacement: true);
  }
}
