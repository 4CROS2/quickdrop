import 'package:apptoastification/apptoastification.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/location/presentation/cubit/location_cubit.dart';
import 'package:quickdrop/src/features/new_location/presentation/widgets/new_location_map.dart';
import 'package:quickdrop/src/features/widgets/text_area.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class NewLocation extends StatefulWidget {
  const NewLocation({super.key});

  @override
  State<NewLocation> createState() => _NewLocationState();
}

class _NewLocationState extends State<NewLocation>
    with SingleTickerProviderStateMixin {
  late GlobalKey<FormState> _formKey;
  late MapController _mapController;
  late final LocationCubit _locationCubit;
  late final TextEditingController _locationNameController;
  late final TextEditingController _directionController;
  late final TextEditingController _districController;
  late final TextEditingController _descriptionController;

  final List<Marker> _currentPosition = <Marker>[];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _locationCubit = sl<LocationCubit>();
    _formKey = GlobalKey<FormState>();
    _locationNameController = TextEditingController();
    _directionController = TextEditingController();
    _districController = TextEditingController();
    _descriptionController = TextEditingController();
    _getCurrentPosition();
  }

  void _setMarker({required LatLng position}) async {
    _mapController.move(position, 16.2);
    setState(() {
      _currentPosition
        ..clear()
        ..add(
          Marker(
            point: position,
            child: Icon(
              Icons.location_on_rounded,
              color: Colors.red,
              size: 25,
            ),
          ),
        );
    });
    final String address = await _locationCubit.getAddress(position: position);
    _directionController.text = address;
  }

  void _getCurrentPosition() async {
    await _locationCubit.getCurrentLocation();
    if (_locationCubit.state is Error) {
      final Error state = (_locationCubit.state as Error);
      _showToast(message: state.message);
    }
    if (_locationCubit.state is Success) {
      final Success state = (_locationCubit.state as Success);
      final LatLng location = state.location.location;
      _setMarker(position: location);
    }
  }

  void _showToast({required String message}) {
    AppToastification.showError(
      context: context,
      title: 'Error',
      message: message,
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    _locationNameController.dispose();
    _directionController.dispose();
    _districController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Constants.mainPadding,
        child: SingleChildScrollView(
          physics: Constants.bouncingScrollPhysics,
          child: Form(
            key: _formKey,
            child: Column(
              spacing: Constants.mainPaddingValue,
              children: <Widget>[
                NewLocationMap(
                  controller: _mapController,
                  marks: _currentPosition,
                  onTap: (TapPosition tapPosition, LatLng point) {
                    _setMarker(position: point);
                  },
                  getCurrentLocation: _getCurrentPosition,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText:
                        'nombre (eje: casa, trabajo, etc..)'.capitalize(),
                  ),
                ),
                TextFormField(
                  controller: _directionController,
                  decoration: InputDecoration(
                    labelText: 'direccion'.capitalize(),
                  ),
                  onChanged: (String value) {},
                ),
                TextFormField(
                  controller: _districController,
                  decoration: InputDecoration(
                    labelText: 'barrio'.capitalize(),
                  ),
                ),
                TextArea(
                  controller: _descriptionController,
                  label: 'descripcion'.capitalize(),
                ),
                Material(
                  borderRadius: Constants.mainBorderRadius,
                  color: Constants.primaryColor,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Padding(
                        padding: Constants.mainPadding,
                        child: Text(
                          'guardar ubicacion'.capitalize(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
