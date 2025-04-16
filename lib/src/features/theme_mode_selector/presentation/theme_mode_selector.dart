import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/theme_mode_selector/presentation/widgets/theme_mode_tile.dart';
import 'package:quickdrop/src/features/widgets/custom_row.dart';

class ThemeModeSelector extends StatefulWidget {
  const ThemeModeSelector({super.key});

  @override
  State<ThemeModeSelector> createState() => _ThemeModeSelectorState();
}

class _ThemeModeSelectorState extends State<ThemeModeSelector> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'seleccionar tema'.capitalize(),
          ),
          Material(
            borderRadius: Constants.mainBorderRadius / 2,
            elevation: 5,
            shadowColor: Colors.transparent,
            type: MaterialType.card,
            child: CustomRow.spacing(
              separator: SizedBox(
                height: 24,
                child: ClipRRect(
                  borderRadius: Constants.mainBorderRadius,
                  child: const VerticalDivider(
                    width: 2,
                  ),
                ),
              ),
              children: const <Widget>[
                ThemeModeTile(
                  themeMode: ThemeMode.system,
                  icon: HugeIcons.strokeRoundedSmartPhone01,
                ),
                ThemeModeTile(
                  themeMode: ThemeMode.dark,
                  icon: HugeIcons.strokeRoundedMoon02,
                ),
                ThemeModeTile(
                  themeMode: ThemeMode.light,
                  icon: HugeIcons.strokeRoundedSun02,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
