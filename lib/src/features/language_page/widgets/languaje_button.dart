import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key});

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/settings/languages');
      },
      child: BlocSelector<AppCubit, AppState, Locale>(
        selector: (AppState state) {
          return state.locale;
        },
        builder: (BuildContext context, Locale state) {
          return Material(
            child: Row(
              children: <Widget>[
                Text(
                  'cambiar idioma'.capitalize(),
                ),
                const Spacer(),
                Text(
                  '( ${state.languageCode} )',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
