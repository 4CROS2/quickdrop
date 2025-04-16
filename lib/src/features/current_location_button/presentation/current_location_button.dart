import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/current_location_button/presentation/cubit/current_location_button_cubit.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class CurrentLocationButton extends StatefulWidget {
  const CurrentLocationButton({super.key});

  @override
  State<CurrentLocationButton> createState() => _CurrentLocationButtonState();
}

class _CurrentLocationButtonState extends State<CurrentLocationButton> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrentLocationButtonCubit>(
      create: (BuildContext context) => sl<CurrentLocationButtonCubit>(),
      child:
          BlocBuilder<CurrentLocationButtonCubit, CurrentLocationButtonState>(
        builder: (BuildContext context, CurrentLocationButtonState state) {
          return Material(
            surfaceTintColor: Constants.secondaryColor,
            elevation: 10,
            shadowColor: Colors.transparent,
            borderRadius: Constants.mainBorderRadius * 2,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => context.push('/mylocations'),
              child: Padding(
                padding: Constants.mainPadding,
                child: switch (state) {
                  Success _ => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      spacing: Constants.mainPaddingValue / 2,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(
                          HugeIcons.strokeRoundedLocation05,
                        ),
                        Flexible(
                          child: Text(
                            (state.locationEntity.isEmpty
                                    ? 'agregar ubicacion'
                                    : '${state.locationEntity.address}(${state.locationEntity.name.trim()})')
                                .toTitleCase(),
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  Loading _ => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  Error _ => Text(state.message),
                  _ => const SizedBox.shrink()
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
