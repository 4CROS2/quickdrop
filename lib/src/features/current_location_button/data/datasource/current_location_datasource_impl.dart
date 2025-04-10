import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickdrop/src/core/extensions/to_map_stream.dart';
import 'package:quickdrop/src/features/current_location_button/domain/repository/current_locatio_datasource_repository.dart';

class ICurrentLocationDatasource implements CurrentLocatioDatasourceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _uid => _auth.currentUser!.uid;

  @override
  Stream<Map<String, dynamic>> getCurrentLocation() {
    try {
      return _firestore
          .collection('users')
          .doc(_uid)
          .collection('locations')
          .where('isDefault', isEqualTo: true)
          .snapshots()
          .toMapStream();
    } catch (e) {
      throw 'error obteniendo ubicacion';
    }
  }
}
