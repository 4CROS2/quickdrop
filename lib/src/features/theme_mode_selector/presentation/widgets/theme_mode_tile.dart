import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class ThemeModeTile extends StatefulWidget {
  const ThemeModeTile({
    required this.icon,
    required this.themeMode,
    super.key,
  });
  final ThemeMode themeMode;
  final IconData icon;

  @override
  State<ThemeModeTile> createState() => _ThemeModeTileState();
}

class _ThemeModeTileState extends State<ThemeModeTile> {
  late final AppCubit _appCubit;

  @override
  void initState() {
    super.initState();
    _appCubit = sl<AppCubit>();
  }

  void _changeTheme() {
    _appCubit.chageTheme(themeMode: widget.themeMode);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppCubit, AppState, bool>(
      selector: (AppState state) {
        return state.themeMode == widget.themeMode;
      },
      builder: (BuildContext context, bool state) {
        return Padding(
          padding: Constants.mainPadding / 2,
          child: GestureDetector(
            onTap: _changeTheme,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AnimatedSlide(
                  duration: const Duration(milliseconds: 300),
                  offset: state ? const Offset(0, -0.1) : Offset.zero,
                  child: Icon(widget.icon),
                ),
                AnimatedSwitcher(
                  duration: Constants.animationTransition,
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: state
                      ? DecoratedBox(
                          key: const ValueKey<String>('active'),
                          decoration: BoxDecoration(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            borderRadius: Constants.mainBorderRadius,
                          ),
                          child: const SizedBox(
                            width: 10,
                            height: 2,
                          ),
                        )
                      : const SizedBox(
                          key: ValueKey<String>('inactive'),
                          width: 10,
                          height: 2,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
