import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/location/presentation/cubit/location_cubit.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class NewLocation extends StatefulWidget {
  const NewLocation({super.key});

  @override
  State<NewLocation> createState() => _NewLocationState();
}

class _NewLocationState extends State<NewLocation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late MapController _mapController;

  @override
  void initState() {
    _mapController = MapController();
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      dragHandleColor: Constants.primaryColor,
      animationController: _animationController,
      builder: (BuildContext context) => Material(
        child: Padding(
          padding: Constants.mainPadding,
          child: BlocProvider<LocationCubit>(
            create: (BuildContext context) =>
                sl<LocationCubit>()..getCurrentLocation(),
            child: BlocConsumer<LocationCubit, LocationState>(
              listener: (BuildContext context, LocationState state) {
                if (state is Success) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) {
                      _mapController.move(
                        LatLng(
                          state.location.location.latitude,
                          state.location.location.longitude,
                        ),
                        16.5,
                      );
                    },
                  );
                }
              },
              builder: (BuildContext context, LocationState state) {
                if (state is Loading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (state is Error) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                if (state is Success) {
                  return Column(
                    spacing: Constants.mainPaddingValue,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        height: 240,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: Constants.mainBorderRadius,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: Constants.mainBorderRadius,
                            child: FlutterMap(
                              options: MapOptions(
                                interactionOptions: InteractionOptions(
                                  flags: InteractiveFlag.all &
                                      ~InteractiveFlag.rotate,
                                ),
                              ),
                              mapController: _mapController,
                              children: <Widget>[
                                TileLayer(
                                  urlTemplate:
                                      'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}.png',
                                  subdomains: const <String>['a', 'b', 'c'],
                                  
                                  userAgentPackageName:
                                      'com.crossdev.quickdrop',
                                  minZoom: 1,
                                ),
                                MarkerLayer(
                                  markers: <Marker>[
                                    Marker(
                                        point: LatLng(
                                          state.location.location.latitude,
                                          state.location.location.longitude,
                                        ),
                                        child: Icon(
                                          Icons.location_on,
                                          color: Colors.red,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextFormField()
                    ],
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
