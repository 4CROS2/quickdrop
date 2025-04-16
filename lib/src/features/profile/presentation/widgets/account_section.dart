import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/profile/presentation/widgets/account_button.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({
    required this.iconSection,
    required this.titleSection,
    required this.children,
    super.key,
  });
  final IconData iconSection;
  final String titleSection;
  final List<AccountButton> children;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Constants.mainPaddingSymetricHorizontal.copyWith(
          top: Constants.mainPaddingValue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Constants.mainPaddingValue,
          children: <Widget>[
            Row(
              spacing: Constants.mainPaddingValue / 2,
              children: <Widget>[
                Icon(
                  iconSection,
                  color: Constants.primaryColor,
                  size: 20,
                ),
                Text(
                  titleSection.capitalize(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
