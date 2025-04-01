import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/user_menu/widgets/menu_options.dart';
import 'package:quickdrop/src/features/user_menu/widgets/user_credits.dart';
import 'package:quickdrop/src/features/user_menu/widgets/user_photo.dart';

class UserMenu extends StatefulWidget {
  const UserMenu({super.key});

  @override
  State<UserMenu> createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: Constants.bouncingScrollPhysics,
          padding: Constants.mainPadding,
          children: <Widget>[
            UserPhoto(),
            UserCredits(),
            MenuOptions(),
          ],
        ),
      ),
    );
  }
}
