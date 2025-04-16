import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/features/current_location_button/presentation/current_location_button.dart';
import 'package:quickdrop/src/features/widgets/header_buton.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      floating: true,
      snap: true,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: const <Widget>[
        SafeArea(
          child: HeaderButton(
            icon: HugeIcons.strokeRoundedNotification01,
            backgroundColor: Colors.transparent,
            badgeVisible: true,
          ),
        ),
      ],
      title: const CurrentLocationButton(),
    );
  }
}
