import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:quickdrop/src/core/functions/uint8list_to_webp.dart';
import 'package:quickdrop/src/features/my_locations/data/model/my_location_model.dart';
import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/my_locations/domain/repository/my_location_datasource_repository.dart';

class IMyLocationsDatasource implements MyLocationsDataSourceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  String get _userId => _auth.currentUser!.uid;

  @override
  Future<void> addLocation({required MyLocationsModel location}) async {
    try {
      final Map<String, dynamic> locationMap = location.toJson();
      final CollectionReference<Map<String, dynamic>> data =
          _firestore.collection('users').doc(_userId).collection('locations');

      final Uint8List imageUInt8 = await convertToWebP(location.mapImage);

      final Reference imagePath =
          _storage.ref().child('users/$_userId/locations/${data.id}.webp');

      await imagePath.putData(
        imageUInt8,
        SettableMetadata(contentType: 'image/webp'),
      );
      await data.add(locationMap);
    } catch (e) {
      throw 'error al guardar ubicacion: $e';
    }
  }

  @override
  Future<void> clearDefaultLocation() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteLocation({required String id}) {
    return _firestore
        .collection('users')
        .doc(_userId)
        .collection('locations')
        .doc(id)
        .delete();
  }

  @override
  Stream<List<Map<String, dynamic>>> getLocations() {
    return _firestore
        .collection('users')
        .doc(_userId)
        .collection('locations')
        .orderBy(
          'createdAt',
          descending: true,
        )
        .snapshots()
        .asyncMap((QuerySnapshot<Map<String, dynamic>> snapshot) async {
      final List<Map<String, dynamic>> locations = await Future.wait(snapshot
          .docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) async {
        final Map<String, dynamic> data = doc.data();
        data['id'] = doc.id;
        try {
          final Reference imageRef = FirebaseStorage.instance
              .ref()
              .child('users/$_userId/locations/${doc.id}.webp');
          data['mapImage'] = await imageRef.getData();
        } on FirebaseException catch (e) {
          // Maneja la excepción de Firebase
          throw ('Error al obtener la imagen: $e');
        } catch (e) {
          // Maneja cualquier otra excepción
          throw ('Error inesperado: $e');
        }

        return data;
      }));
      return locations;
    });
  }

  @override
  Future<void> updateLocation({required MyLocationsEntity location}) {
    throw UnimplementedError();
  }
}
