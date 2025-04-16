import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/set_default_location/presentation/set_default_location.dart';

class LocationTile extends StatefulWidget {
  const LocationTile({required this.location, super.key});
  final MyLocationsEntity location;
  @override
  State<LocationTile> createState() => _LocationTileState();
}

class _LocationTileState extends State<LocationTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Constants.animationTransition,
      reverseDuration: Constants.animationTransition,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 120,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    if (widget.location.isDefault) {
      _controller.value = 1.0;
    } else {
      _controller.value = 0.0;
    }
  }

  @override
  void didUpdateWidget(covariant LocationTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.location.isDefault) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.paddingTop / 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: Constants.mainBorderRadius,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0, 10),
              blurRadius: 50,
              spreadRadius: 0,
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {},
          onLongPress: () {},
          child: Padding(
            padding: Constants.mainPadding / 2,
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Constants.mainPaddingValue / 2,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (BuildContext context, Widget? child) {
                        return SizedBox(
                          width: double.infinity,
                          height: _animation.value,
                          child: child,
                        );
                      },
                      child: ClipRRect(
                        borderRadius: Constants.mainBorderRadius / 2,
                        child: Image.memory(
                          widget.location.mapImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    _locationDescription(
                      label: 'nombre',
                      data: widget.location.name,
                    ),
                    _locationDescription(
                      label: 'direccion',
                      data: widget.location.address,
                    ),
                    _locationDescription(
                      label: 'descripcion',
                      data: widget.location.description,
                    )
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: SetDefaultLocation(
                    location: widget.location,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _locationDescription({
    required String label,
    required String data,
  }) {
    return Padding(
      padding: Constants.mainPaddingSymetricHorizontal,
      child: Text.rich(
        TextSpan(
          text: '$label: '.capitalize(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          children: <InlineSpan>[
            TextSpan(
              text: data.capitalize(),
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
