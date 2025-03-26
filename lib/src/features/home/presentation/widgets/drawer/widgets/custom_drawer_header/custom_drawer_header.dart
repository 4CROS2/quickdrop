import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/drawer/widgets/custom_drawer_header/widgets/user_credits_button.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/drawer/widgets/custom_drawer_header/widgets/user_profile_button.dart';

class CustomDrawerHeader extends StatefulWidget {
  const CustomDrawerHeader({super.key});

  @override
  State<CustomDrawerHeader> createState() => _CustomDrawerHeaderState();
}

class _CustomDrawerHeaderState extends State<CustomDrawerHeader> {
  late final AppState _appState;

  @override
  void initState() {
    super.initState();
    _appState = context.read<AppCubit>().state;
  }

  @override
  Widget build(BuildContext context) {
    final double paddingStatusBar = MediaQuery.paddingOf(context).top;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Constants.primaryColor,
      ),
      child: Padding(
        padding: Constants.mainPadding.copyWith(
          top: paddingStatusBar,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UserProfileButton(
              name: _appState.user.name,
              profileImage: _appState.user.photo,
            ),
            UserCreditsButton()
          ],
        ),
      ),
    );
  }
}
