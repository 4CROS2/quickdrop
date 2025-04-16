import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key});

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  late final AppCubit _appCubit;

  @override
  void initState() {
    super.initState();
    _appCubit = sl<AppCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/settings/languages');
      },
      child: Material(
        child: Row(
          children: <Widget>[
            Text(
              'cambiar idioma'.capitalize(),
            ),
            Spacer(),
            Text(
              '( ${_appCubit.state.locale.languageCode} )',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
