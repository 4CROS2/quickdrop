import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class UserCredits extends StatelessWidget {
  const UserCredits({super.key});
  int get _credits => sl<AppCubit>().state.user.credits;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.paddingTop,
      child: Material(
        surfaceTintColor: Theme.of(context).cardTheme.surfaceTintColor,
        borderRadius: Constants.mainBorderRadius,
        child: InkWell(
          child: Padding(
            padding: Constants.mainPadding,
            child: Row(
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: 'tus creditos: '.capitalize(),
                    children: <InlineSpan>[
                      TextSpan(
                        text: formatPrice(_credits),
                        style: const TextStyle(
                          color: Constants.secondaryColor,
                          fontFamily: 'AlbertSans',
                        ),
                      )
                    ],
                  ),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
