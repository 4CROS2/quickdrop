import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/features/account/presentation/widgets/account_button.dart';
import 'package:quickdrop/src/features/account/presentation/widgets/account_section.dart';
import 'package:quickdrop/src/features/account/presentation/widgets/close_sesion_button.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/features/auth/domain/entity/user_entity.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final AppCubit _appCubit;
  late final UserEntity _user;
  @override
  void initState() {
    super.initState();
    _appCubit = sl<AppCubit>();
    _user = _appCubit.state.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              'cuenta'.capitalize(),
            ),
            pinned: true,
          ),
          AccountSection(
            iconSection: HugeIcons.strokeRoundedUser03,
            titleSection: 'informacion personal',
            children: <AccountButton>[
              AccountButton(
                onTap: () {},
                sectionIcon: HugeIcons.strokeRoundedUserAccount,
                label: 'nombre',
                information: _user.name,
              ),
              AccountButton(
                onTap: () {},
                label: 'correo',
                sectionIcon: HugeIcons.strokeRoundedMailAccount02,
                information: _user.email,
              ),
            ],
          ),
          AccountSection(
            iconSection: HugeIcons.strokeRoundedSecurityLock,
            titleSection: 'seguridad',
            children: <AccountButton>[
              AccountButton(
                onTap: () {},
                sectionIcon: Icons.verified_outlined,
                label: 'verificacion de cuenta',
                information:
                    _user.isVerified ? 'cuenta verificada' : 'verificar cuenta',
              ),
              AccountButton(
                onTap: () {},
                sectionIcon: HugeIcons.strokeRoundedResetPassword,
                label: 'contraseña',
                information: 'cambiar contraseña',
              ),
              AccountButton(
                onTap: () {},
                sectionIcon: HugeIcons.strokeRoundedBiometricDevice,
                label: 'desbloqueo de la app',
                information: 'seguridad de app',
              ),
              AccountButton(
                onTap: () {},
                sectionIcon: HugeIcons.strokeRoundedSmartPhone01,
                label: 'Dispositivos vinculados',
                information: 'administrar dispositivos',
              )
            ],
          ),
          AccountSection(
            iconSection: HugeIcons.strokeRoundedAccountSetting03,
            titleSection: 'sesion',
            children: <AccountButton>[
              CloseSesion(),
            ],
          )
        ],
      ),
    );
  }
}
