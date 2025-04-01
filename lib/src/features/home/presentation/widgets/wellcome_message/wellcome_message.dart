import 'dart:math';

import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class WellcomeMessage extends StatelessWidget {
  WellcomeMessage({super.key});
  final AppCubit _appCubit = sl<AppCubit>();
  String get _name => _appCubit.state.user.name.split(' ')[0];
  final String _welcomeMessage = CustomWellcomeMessage().message();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: Constants.mainPadding,
      sliver: SliverToBoxAdapter(
        child: Text.rich(
          TextSpan(
            text: 'Bienvenido'.capitalize(),
            children: <InlineSpan>[
              TextSpan(
                text: '\n$_name.',
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
    );
  }
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
