import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/features/auth/domain/entity/user_entity.dart';
import 'package:quickdrop/src/features/widgets/image_loader.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({
    super.key,
  });

  double get _paddingPosition => Constants.mainPaddingValue;

  UserEntity get _user => sl<AppCubit>().state.user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/profile'),
      child: Stack(
        children: <Widget>[
          Material(
            borderRadius: Constants.mainBorderRadius,
            elevation: 10,
            type: MaterialType.card,
            shadowColor: Colors.transparent,
            child: SizedBox(
              width: double.infinity,
              height: 180,
            ),
          ),
          Positioned(
            bottom: _paddingPosition,
            left: _paddingPosition,
            right: _paddingPosition,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: Constants.mainPaddingValue,
              children: <Widget>[
                ClipRRect(
                  borderRadius: Constants.mainBorderRadius / 2,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: Constants.mainBorderRadius / 2,
                    ),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: ImageLoader(
                        imageUrl: _user.photo,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    _user.name.toTitleCase(),
                    style: TextStyle(
                      fontSize: 22,
                      height: 1,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
