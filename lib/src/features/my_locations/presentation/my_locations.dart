import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/my_locations/presentation/cubit/my_locations_cubit.dart';
import 'package:quickdrop/src/features/my_locations/presentation/widgets/add_location.dart';
import 'package:quickdrop/src/features/my_locations/presentation/widgets/empty_locations.dart';
import 'package:quickdrop/src/features/my_locations/presentation/widgets/location_tile.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class MyLocations extends StatefulWidget {
  const MyLocations({super.key});

  @override
  State<MyLocations> createState() => _MyLocationsState();
}

class _MyLocationsState extends State<MyLocations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MyLocationsCubit>(
        create: (BuildContext context) => sl<MyLocationsCubit>(),
        child: BlocBuilder<MyLocationsCubit, MyLocationsState>(
          builder: (BuildContext context, MyLocationsState state) {
            final Color color = Theme.of(context).scaffoldBackgroundColor;
            return CustomScrollView(
              physics: Constants.bouncingScrollPhysics,
              slivers: <Widget>[
                SliverAppBar(
                  elevation: 0,
                  pinned: true,
                  surfaceTintColor: color,
                  backgroundColor: color,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () => context.pop(),
                    child: Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  title: Text(
                    'ubicaciones'.capitalize(),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                if (state is Loading)
                  SliverFillRemaining(
                    fillOverscroll: true,
                    hasScrollBody: false,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                if (state is Success)
                  _LocationsBody(
                    locations: state.locations,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LocationsBody extends StatelessWidget {
  const _LocationsBody({required this.locations});
  final List<MyLocationsEntity> locations;
  @override
  Widget build(BuildContext context) {
    if (locations.isEmpty) {
      return EmptyLocations();
    }

    return SliverPadding(
      padding: Constants.mainPadding,
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            Padding(
              padding: Constants.mainPaddingSymetricVertical,
              child: Text(
                'Selecciona la ubicacion de entrega de tus pedidos',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),
            ...locations.map(
              (MyLocationsEntity location) => LocationTile(),
            ),
            Padding(
              padding: Constants.paddingTop,
              child: AddLocation(),
            )
          ],
        ),
      ),
    );
  }
}
