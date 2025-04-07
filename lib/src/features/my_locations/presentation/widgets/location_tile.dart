import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/widgets/image_loader.dart';

class LocationTile extends StatefulWidget {
  const LocationTile({required this.location, super.key});
  final MyLocationsEntity location;
  @override
  State<LocationTile> createState() => _LocationTileState();
}

class _LocationTileState extends State<LocationTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.paddingTop / 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: Constants.mainBorderRadius,
          boxShadow: <BoxShadow>[
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
          child: Padding(
            padding: Constants.mainPadding / 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Constants.mainPaddingValue / 2,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: Constants.mainBorderRadius / 2,
                        child: ImageLoader(
                          imageUrl:
                              'https://st3.depositphotos.com/1105977/16920/i/450/depositphotos_169209040-stock-photo-beautiful-autumn-scenery-in-park.jpg',
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Checkbox.adaptive(
                          value: true,
                          onChanged: (bool? value) {},
                        ),
                      )
                    ],
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
          ),
        ),
      ),
    );
  }

  Widget _locationDescription({
    required String label,
    required String data,
  }) {
    return Text.rich(
      TextSpan(
        text: '$label: '.capitalize(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: data.capitalize(),
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
