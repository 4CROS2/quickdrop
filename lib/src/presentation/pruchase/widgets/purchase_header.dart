import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/presentation/widgets/header_buton.dart';

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
                    HeaderButtons(
                      onTap: () => context.pop(),
                      backgroundColor: Colors.black12,
                      icon: Icons.arrow_back_ios_rounded,
                    ),
                    Flexible(
                      child: Text(
                        'confirmar datos de compra'.capitalize(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
