import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/new_location/presentation/new_location.dart';

class AddLocation extends StatelessWidget {
  const AddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: Constants.mainBorderRadius / 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          /*  showCupertinoSheet(
            context: context,
            useNestedNavigation: true,
            pageBuilder: (BuildContext context) => NewLocation(),
          ); */
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            isScrollControlled: true,
            isDismissible: true,
            enableDrag: true,
            useSafeArea: true,
            useRootNavigator: true,
            scrollControlDisabledMaxHeightRatio: .5,
            elevation: 5,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            sheetAnimationStyle: AnimationStyle(
              curve: Curves.easeIn,
              reverseCurve: Curves.easeOut,
              duration: Constants.animationTransition,
            ),
            builder: (BuildContext context) {
              return const NewLocation();
            },
          );
        },
        child: Padding(
          padding: Constants.mainPadding,
          child: Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                HugeIcons.strokeRoundedLocationAdd02,
              ),
              Text(
                'agregar ubicacion'.capitalize(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
