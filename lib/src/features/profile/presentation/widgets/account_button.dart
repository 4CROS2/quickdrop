import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    required this.label,
    required this.information,
    this.onTap,
    this.sectionIcon,
    super.key,
  });
  final String label;
  final IconData? sectionIcon;
  final String information;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: Constants.mainBorderRadius,
      child: Padding(
        padding: Constants.mainPaddingSymetricHorizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              spacing: Constants.mainPaddingValue,
              children: <Widget>[
                Icon(
                  sectionIcon,
                ),
                Text.rich(
                  TextSpan(
                    text: '$label \n'.capitalize(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: information,
                        style: const TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            )
          ],
        ),
      ),
    );
  }
}
