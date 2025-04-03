import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class EmptyLocations extends StatelessWidget {
  const EmptyLocations({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Material(
            borderRadius: Constants.mainBorderRadius,
            shadowColor: Colors.transparent,
            elevation: 5,
            surfaceTintColor: Constants.primaryColor,
            child: Padding(
              padding: Constants.mainPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: <Widget>[
                  Text(
                    'aun no tienes ubicaciones registradas'.capitalize(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    borderRadius: Constants.mainBorderRadius / 2,
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          showDragHandle: true,
                          sheetAnimationStyle: AnimationStyle(
                            curve: Curves.easeIn,
                            reverseCurve: Curves.easeOut,
                            duration: Constants.animationTransition,
                          ),
                          builder: (BuildContext context) {
                            return BottomSheet(
                              onClosing: () {},
                              builder: (BuildContext context) => Material(
                                child: Text('uno dos tres'),
                              ),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: Constants.mainPadding,
                        child: Row(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              HugeIcons.strokeRoundedLocationAdd02,
                            ),
                            Text(
                              'agregar ubicacion'.capitalize(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
