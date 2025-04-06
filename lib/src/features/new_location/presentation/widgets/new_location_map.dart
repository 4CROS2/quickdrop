import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class NewLocationMap extends StatefulWidget {
  const NewLocationMap({
    required this.controller,
    this.getCurrentLocation,
    this.marks = const <Marker>[],
    this.onTap,
    super.key,
  });

  final MapController controller;
  final List<Marker> marks;
  final Function(TapPosition tapPosition, LatLng point)? onTap;
  final VoidCallback? getCurrentLocation;

  @override
  State<NewLocationMap> createState() => _NewLocationMapState();
}

class _NewLocationMapState extends State<NewLocationMap> {
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
      width: double.infinity,
      height: 380,
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: Constants.mainBorderRadius,
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
                    urlTemplate:
                        Theme.of(context).brightness == Brightness.light
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
                  _mapButton(
                    onTap: _toggleStatusMap,
                    icon: isEnabled
                        ? HugeIcons.strokeRoundedEditOff
                        : HugeIcons.strokeRoundedEdit02,
                  ),
                  if (isEnabled)
                    _mapButton(
                      onTap: widget.getCurrentLocation,
                      icon: HugeIcons.strokeRoundedLocation01,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _mapButton({required IconData icon, VoidCallback? onTap}) {
    return Material(
      borderRadius: Constants.mainBorderRadius / 2,
      elevation: 5,
      shadowColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      surfaceTintColor: Constants.primaryColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: Constants.mainPadding,
          child: AnimatedSwitcher(
            duration: Constants.animationTransition * .8,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Icon(
              key: Key(icon.toString()),
              icon,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
