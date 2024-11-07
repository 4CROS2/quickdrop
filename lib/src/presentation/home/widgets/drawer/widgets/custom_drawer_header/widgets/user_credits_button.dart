import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/presentation/app/cubit/app_cubit.dart';

class UserCreditsButton extends StatefulWidget {
  const UserCreditsButton({
    super.key,
  });

  @override
  State<UserCreditsButton> createState() => _UserCreditsButtonState();
}

class _UserCreditsButtonState extends State<UserCreditsButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (BuildContext context, AppState state) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Material(
            borderRadius: Constants.mainBorderRadius,
            child: InkWell(
              onTap: () {},
              borderRadius: Constants.mainBorderRadius,
              child: Padding(
                padding: Constants.mainPadding,
                child: SizedBox(
                  width: double.infinity,
                  child: Text.rich(
                    TextSpan(
                      text: 'creditos: '.capitalize(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: formatPrice(state.user.credits),
                          style: TextStyle(
                            color: Constants.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
