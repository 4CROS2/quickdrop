import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:quickdrop/src/core/functions/uint8list_to_webp.dart';
import 'package:quickdrop/src/features/my_locations/data/model/my_location_model.dart';
import 'package:quickdrop/src/features/new_location/domain/repository/new_location_datasource_repository.dart';

class INewLocationDatasource implements NewLocationDatasourceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  String get _userId => _auth.currentUser!.uid;

  @override
  Future<void> addLocation({required MyLocationsModel location}) async {
    try {
      final Map<String, dynamic> locationMap = location.toJson();
      final DocumentReference<Map<String, dynamic>> data = _firestore
          .collection('users')
          .doc(_userId)
          .collection('locations')
          .doc();

      print(data.id);

      final Uint8List imageUInt8 = await convertToWebP(location.mapImage);
      final Reference imagePath =
          _storage.ref().child('users/$_userId/locations/${data.id}.webp');

      await imagePath.putData(
        imageUInt8,
        SettableMetadata(contentType: 'image/webp'),
      );
      await data.set(locationMap);
    } catch (e) {
      throw 'error al guardar ubicacion: $e';
    }
  }
}
