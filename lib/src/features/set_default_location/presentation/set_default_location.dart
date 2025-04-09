import 'package:apptoastification/apptoastification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/set_default_location/presentation/cubit/set_default_location_cubit.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class SetDefaultLocation extends StatefulWidget {
  const SetDefaultLocation({required this.location, super.key});
  final MyLocationsEntity location;

  @override
  State<SetDefaultLocation> createState() => _SetDefaultLocationState();
}

class _SetDefaultLocationState extends State<SetDefaultLocation> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetDefaultLocationCubit>(
      create: (BuildContext context) => sl<SetDefaultLocationCubit>(),
      child: BlocConsumer<SetDefaultLocationCubit, SetDefaultLocationState>(
        listener: (BuildContext context, SetDefaultLocationState state) {
          if (state is Error) {
            AppToastification.showError(
              context: context,
              message: state.message,
            );
          }
        },
        builder: (BuildContext context, SetDefaultLocationState state) {
          final SetDefaultLocationCubit cubit =
              context.read<SetDefaultLocationCubit>();
          return AnimatedSwitcher(
            duration: Constants.animationTransition,
            child: switch (state) {
              Loading _ => Padding(
                  padding: Constants.mainPadding / 2,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              _ => Checkbox.adaptive(
                  visualDensity: VisualDensity.compact,
                  value: widget.location.isDefault,
                  onChanged: (bool? value) {
                    cubit.setDefaultLocation(
                      locationId: widget.location.id,
                    );
                  },
                )
            },
          );
        },
      ),
    );
  }
}
