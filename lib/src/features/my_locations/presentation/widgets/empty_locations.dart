import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/my_locations/presentation/widgets/add_location.dart';

class EmptyLocations extends StatelessWidget {
  const EmptyLocations({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
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
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const AddLocation()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
