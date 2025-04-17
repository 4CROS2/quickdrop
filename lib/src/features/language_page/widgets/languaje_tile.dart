import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/features/widgets/image_loader.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class LanguageTile extends StatefulWidget {
  const LanguageTile({
    required Locale locale,
    super.key,
  }) : _locale = locale;
  final Locale _locale;

  @override
  State<LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<LanguageTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  late final AppCubit _appCubit;
  @override
  void initState() {
    super.initState();
    _appCubit = sl<AppCubit>();
    _controller = AnimationController(
      vsync: this,
      duration: Constants.animationTransition,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppCubit, AppState, Locale>(
      selector: (AppState state) {
        final bool currentLocale = state.locale == widget._locale;

        if (currentLocale) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
        return state.locale;
      },
      builder: (BuildContext context, Locale state) {
        return AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                borderRadius: Constants.mainBorderRadius,
                border: Border.all(
                  width: 3,
                  color: Color.lerp(
                    Colors.transparent,
                    Constants.primaryColor,
                    _animation.value,
                  )!,
                ),
              ),
              child: child,
            );
          },
          child: Material(
            borderRadius: Constants.mainBorderRadius,
            type: MaterialType.card,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                _appCubit.changeLanguaje(
                  locale: widget._locale,
                );
              },
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Opacity(
                      opacity: .5,
                      child: ImageLoader(
                        imageUrl:
                            'https://flagcdn.com/h120/${widget._locale.countryCode?.toLowerCase()}.png',
                        boxFit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: Constants.mainPadding,
                    child: Text(
                      widget._locale.languageCode.capitalize(),
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
    );
  }
}
