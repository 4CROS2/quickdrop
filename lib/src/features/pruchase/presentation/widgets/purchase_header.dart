import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/widgets/header_buton.dart';

class PruchaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PruchaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: <Widget>[
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.mainPadding.right,
                ).copyWith(top: 8),
                child: Row(
                  spacing: Constants.mainPadding.left,
                  children: <Widget>[
                    HeaderButton(
                      onTap: () => context.pop(),
                      backgroundColor: Colors.black12,
                      icon: Icons.arrow_back_ios_rounded,
                    ),
                    Flexible(
                      flex: 5,
                      child: Text(
                        'Facturación'.capitalize(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, Constants.minHeight);
}
