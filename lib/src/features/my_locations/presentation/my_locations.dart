import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/my_locations/presentation/cubit/my_locations_cubit.dart';
import 'package:quickdrop/src/features/my_locations/presentation/widgets/empty_locations.dart';
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
            return CustomScrollView(
              physics: Constants.bouncingScrollPhysics,
              slivers: <Widget>[
                SliverAppBar(
                  elevation: 5,
                  pinned: true,
                  title: Text(
                    'mis ubicaciones'.capitalize(),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                if (<String>[].isEmpty) EmptyLocations()
              ],
            );
          },
        ),
      ),
    );
  }
}
