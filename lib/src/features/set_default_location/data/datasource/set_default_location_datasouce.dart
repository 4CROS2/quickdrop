import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickdrop/src/features/set_default_location/domain/repository/set_default_location_datasource_repositoy.dart';

class ISetDefaultLocationDatasouce
    implements SetDefaultLocationDatasourceRepositoy {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _userId => _auth.currentUser!.uid;

  @override
  Future<void> setDefaultLocation({required String id}) async {
    try {
      final CollectionReference<Map<String, dynamic>> locationsCollection =
          _firestore.collection('users').doc(_userId).collection('locations');

      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await locationsCollection.where('isDefault', isEqualTo: true).get();

      if (querySnapshot.docs.isNotEmpty) {
        final QueryDocumentSnapshot<Map<String, dynamic>> oldDefaultDoc =
            querySnapshot.docs.first;
        final String oldId = oldDefaultDoc.id;

        if (id == oldId) {
          await locationsCollection
              .doc(oldId)
              .update(<Object, Object?>{'isDefault': false});
          return;
        }

        // Si existe una ubicación default, la desmarcamos
        await locationsCollection
            .doc(oldId)
            .update(<Object, Object?>{'isDefault': false});
      }

      // Actualizamos la ubicación seleccionada como default
      await locationsCollection
          .doc(id)
          .update(<Object, Object?>{'isDefault': true});
    } catch (e) {
      rethrow;
    }
  }
}
