import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/localization/app_localizations.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/features/widgets/image_loader.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late List<Locale> _localizations;
  late AppCubit _appCubit;
  List<Locale> _languajes = <Locale>[];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localizations = AppLocalizations.supportedLocales;
    _appCubit = sl<AppCubit>();
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
                return DecoratedBox(
                  position: DecorationPosition.foreground,
                  decoration: BoxDecoration(
                    borderRadius: Constants.mainBorderRadius,
                    border: Border.all(
                      width: 3,
                      color: Color.lerp(
                        Colors.transparent,
                        Constants.primaryColor,
                        _appCubit.state.locale == _languajes[index] ? 1 : 0,
                      )!,
                    ),
                  ),
                  child: Material(
                    borderRadius: Constants.mainBorderRadius,
                    type: MaterialType.card,
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        _appCubit.changeLanguaje(
                          locale: _languajes[index],
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Opacity(
                              opacity: .5,
                              child: ImageLoader(
                                imageUrl:
                                    'https://flagcdn.com/h120/${_languajes[index].countryCode?.toLowerCase()}.png',
                                boxFit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constants.mainPadding,
                            child: Text(
                              _languajes[index].languageCode.capitalize(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
