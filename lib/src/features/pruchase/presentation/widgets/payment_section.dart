import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/pruchase/presentation/widgets/title_section.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({
    required String title,
    required Widget child,
    super.key,
  })  : _child = child,
        _title = title;

  final Widget _child;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.mainPadding.copyWith(
        top: 0,
        left: 0,
        right: 0,
      ),
      child: Material(
        color: Constants.secondaryColor,
        borderRadius: Constants.mainBorderRadius,
        child: Padding(
          padding: Constants.mainPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Constants.mainPaddingValue,
            children: <Widget>[
              TitleSection(
                label: _title,
              ),
              _child,
            ],
          ),
        ),
      ),
    );
  }
}
