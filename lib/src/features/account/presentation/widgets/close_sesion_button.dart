import 'dart:io';

import 'package:extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/account/presentation/widgets/account_button.dart';
import 'package:quickdrop/src/features/auth/domain/usecase/auth_usecase.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class CloseSesion extends StatelessWidget implements AccountButton {
  CloseSesion({super.key});
  final AuthUseCase _auth = sl<AuthUseCase>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: Constants.mainBorderRadius,
      onTap: () => closeSesion(context),
      child: Padding(
        padding: Constants.mainPadding,
        child: Row(
          spacing: Constants.mainPaddingValue,
          children: <Widget>[
            Icon(
              sectionIcon,
            ),
            Text(
              label.capitalize(),
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> closeSesion(BuildContext context) async {
    final bool iOSdevice = Platform.isIOS;
    if (iOSdevice) {
      await showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: _cupertionAlertDialog,
      );
    } else {
      await showDialog(
        context: context,
        builder: _materialDialog,
      );
    }
  }

  Widget _cupertionAlertDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        label,
      ),
      content: Text('¿deseas cerrar sesion?'.capitalize()),
      actions: <Widget>[
        _cupertionoAlertActionDialog(
          label: 'cancelar'.capitalize(),
          isDestructive: true,
          onTap: () => _closeMenu(context),
        ),
        _cupertionoAlertActionDialog(
          label: 'aceptar'.capitalize(),
          onTap: () async => await _logOut(),
        ),
      ],
    );
  }

  Widget _materialDialog(BuildContext context) {
    return AlertDialog(
      title: Text(label),
      content: Text(
        '¿deseas cerrar sesion?'.capitalize(),
      ),
      actions: <Widget>[
        _materialAlertActionDialog(
          context,
          label: 'cancelar',
          textColor: Colors.red,
          onTap: () => _closeMenu(context),
        ),
        _materialAlertActionDialog(
          context,
          label: 'aceptar',
          onTap: () => _logOut(),
        )
      ],
    );
  }

  Widget _cupertionoAlertActionDialog({
    required String label,
    bool isDestructive = false,
    void Function()? onTap,
  }) {
    return CupertinoDialogAction(
      onPressed: onTap,
      isDestructiveAction: isDestructive,
      child: Text(
        label.capitalize(),
      ),
    );
  }

  Widget _materialAlertActionDialog(
    BuildContext context, {
    required String label,
    VoidCallback? onTap,
    Color? textColor,
  }) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label.capitalize(),
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _closeMenu(BuildContext context) => context.pop();
  Future<void> _logOut() async => await _auth.logout();

  @override
  String get information => throw UnimplementedError('no implementado');

  @override
  String get label => 'cerrar sesion'.capitalize();

  @override
  VoidCallback? get onTap => throw UnimplementedError();
  @override
  IconData? get sectionIcon => HugeIcons.strokeRoundedLogout02;
}
