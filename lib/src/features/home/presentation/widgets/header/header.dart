import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/header/widgets/location_header.dart';
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
      actions: <Widget>[
        SafeArea(
          child: HeaderButton(
            icon: HugeIcons.strokeRoundedNotification01,
            backgroundColor: Colors.transparent,
            badgeVisible: true,
          ),
        ),
      ],
      title: const LocationHeader(),
    );
  }
}
