import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/features/language_page/widgets/languaje_button.dart';
import 'package:quickdrop/src/features/settings/presentation/widgets/setting_tile.dart';
import 'package:quickdrop/src/features/theme_mode_selector/presentation/theme_mode_selector.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              'ajustes'.capitalize(),
            ),
            pinned: true,
          ),
          SliverList.list(
            children: const <Widget>[
              SettingTile(
                sectionTitle: 'idioma',
                child: LanguageButton(),
              ),
              SettingTile(
                sectionTitle: 'tema',
                child: ThemeModeSelector(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
