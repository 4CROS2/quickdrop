import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickdrop/src/features/my_locations/data/model/my_location_model.dart';
import 'package:quickdrop/src/features/my_locations/domain/entity/my_locations_entity.dart';
import 'package:quickdrop/src/features/my_locations/domain/repository/my_location_datasource_repository.dart';

class IMyLocationsDatasource implements MyLocationsDataSourceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _userId => _auth.currentUser!.uid;

  @override
  Future<void> addLocation({required MyLocationsModel location}) {
    final Map<String, dynamic> locationMap = location.toJson();
    return _firestore
        .collection('users')
        .doc(_userId)
        .collection('locations')
        .add(locationMap);
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
    final Stream<List<Map<String, dynamic>>> locations = _firestore
        .collection('users')
        .doc(_userId)
        .collection('locations')
        .snapshots()
        .toMapJsonListStream();
    return locations;
  }

  @override
  Future<void> setDefaultLocation({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateLocation({required MyLocationsEntity location}) {
    throw UnimplementedError();
  }
}
