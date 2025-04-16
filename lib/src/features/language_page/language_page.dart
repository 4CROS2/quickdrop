import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/localization/app_localizations.dart';
import 'package:quickdrop/src/features/language_page/widgets/languaje_tile.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late List<Locale> _localizations;
  List<Locale> _languajes = <Locale>[];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localizations = AppLocalizations.supportedLocales;
    _languajes = _localizations
        .where((Locale locale) => locale.countryCode != null)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text('idiomas'.capitalize()),
          ),
          SliverPadding(
            padding: Constants.mainPadding,
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Constants.mainPaddingValue,
                mainAxisSpacing: Constants.mainPaddingValue,
              ),
              itemCount: _languajes.length,
              itemBuilder: (BuildContext context, int index) {
                return LanguageTile(
                  locale: _languajes[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
