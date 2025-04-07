import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/location/presentation/cubit/location_cubit.dart';
import 'package:quickdrop/src/features/new_location/presentation/widgets/new_location_map_buttons.dart';

class NewLocationMap extends StatefulWidget {
  const NewLocationMap({
    required this.locationState,
    required this.controller,
    this.getCurrentLocation,
    this.marks = const <Marker>[],
    this.onTap,
    super.key,
  });

  final LocationState locationState;
  final MapController controller;
  final List<Marker> marks;
  final Function(TapPosition tapPosition, LatLng point)? onTap;
  final VoidCallback? getCurrentLocation;

  @override
  State<NewLocationMap> createState() => _NewLocationMapState();
}

class _NewLocationMapState extends State<NewLocationMap>
    with SingleTickerProviderStateMixin {
  final String _mapLightUrl =
      'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}.png';
  final String _mapDarkUrl =
      'https://{s}.basemaps.cartocdn.com/rastertiles/dark_all/{z}/{x}/{y}.png';
  final List<Marker> marks = <Marker>[];
  bool isEnabled = false;

  void _toggleStatusMap() {
    setState(() {
      isEnabled = !isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: <Widget>[
          IgnorePointer(
            ignoring: !isEnabled,
            child: FlutterMap(
              options: MapOptions(
                initialZoom: 15,
                initialCenter: LatLng(4.277866, -73.520570),
                interactionOptions: InteractionOptions(
                  flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                ),
                onTap: widget.onTap,
              ),
              mapController: widget.controller,
              children: <Widget>[
                TileLayer(
                  urlTemplate: Theme.of(context).brightness == Brightness.light
                      ? _mapLightUrl
                      : _mapDarkUrl,
                  subdomains: const <String>['a', 'b', 'c'],
                  userAgentPackageName: 'com.crossdev.quickdrop',
                  minZoom: 1,
                  retinaMode: RetinaMode.isHighDensity(context),
                ),
                MarkerLayer(
                  markers: widget.marks,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: Constants.mainPaddingValue,
            right: Constants.mainPaddingValue,
            child: Column(
              verticalDirection: VerticalDirection.up,
              spacing: Constants.mainPaddingValue,
              children: <Widget>[
                NewLocationMapButton(
                  onTap: _toggleStatusMap,
                  icon: isEnabled
                      ? HugeIcons.strokeRoundedEditOff
                      : HugeIcons.strokeRoundedEdit02,
                ),
                if (isEnabled)
                  NewLocationMapButton(
                    onTap: widget.getCurrentLocation,
                    icon: HugeIcons.strokeRoundedLocation01,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
