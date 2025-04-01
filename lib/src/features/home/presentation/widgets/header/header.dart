import 'dart:math';

import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/features/home/presentation/widgets/header/widgets/location_header.dart';
import 'package:quickdrop/src/features/widgets/header_buton.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class HomeHeader extends SliverPersistentHeaderDelegate {
  HomeHeader();
  final double maxExtentHeader = 220.0;
  final double minExtentHeader = 115.0;
  final AppCubit _appCubit = sl<AppCubit>();

  String get _name => _appCubit.state.user.name.split(' ')[0];

  final String _welcomeMessage = CustomWellcomeMessage().message();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double percent = shrinkOffset / (maxExtentHeader - minExtentHeader);
    final double opacity = 1 - percent;
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SizedBox.expand(
        child: Padding(
          padding: Constants.mainPadding,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                left: 0,
                child: Opacity(
                  opacity: opacity.clamp(0, 1),
                  child: Text.rich(
                    TextSpan(
                      text: 'bienvenido'.capitalize(),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '\n$_name.'.toTitleCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Constants.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '\n$_welcomeMessage',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                      height: .9,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Row(
                    spacing: Constants.mainPaddingValue,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      HeaderButton(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        icon: Icons.menu_rounded,
                      ),
                      Flexible(
                        child: LocationHeader(),
                      ),
                      HeaderButton(
                        icon: HugeIcons.strokeRoundedNotification01,
                        iconColor: Colors.white,
                        badgeVisible: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxExtentHeader;

  @override
  double get minExtent => minExtentHeader;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class CustomWellcomeMessage {
  String message() {
    final int ahora = DateTime.now().hour;
    final Random random = Random();

    final List<String> mensajesDesayuno = <String>[
      '¿Qué deseas para desayunar?',
      '¡Hora de un buen desayuno! ¿Qué se te antoja?',
      '¿Buscando algo para empezar el día con energía?',
    ];

    final List<String> mensajesAlmuerzo = <String>[
      '¿Buscando algo rico para almorzar?',
      'Es hora del almuerzo, ¿qué te gustaría comer?',
      '¿Qué te apetece para esta tarde?',
    ];

    final List<String> mensajesCena = <String>[
      '¿Qué te gustaría cenar esta noche?',
      'Es el momento perfecto para una cena deliciosa.',
      '¿Tienes algo en mente para cenar?',
    ];

    if (ahora >= 6 && ahora < 12) {
      return mensajesDesayuno[random.nextInt(mensajesDesayuno.length)];
    } else if (ahora >= 12 && ahora < 18) {
      return mensajesAlmuerzo[random.nextInt(mensajesAlmuerzo.length)];
    } else if (ahora >= 18 && ahora < 22) {
      return mensajesCena[random.nextInt(mensajesCena.length)];
    } else {
      return 'Hola, ¿cómo puedo ayudarte?';
    }
  }
}
