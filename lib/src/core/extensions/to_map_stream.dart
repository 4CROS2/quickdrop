import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

extension ToMapStream on Stream<QuerySnapshot<Map<String, dynamic>>> {
  /// Transforma un stream de QuerySnapshot a un stream de mapas con los datos del primer documento
  Stream<Map<String, dynamic>> toMapStream() {
    return switchMap((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        // Devuelve un mapa vacío si no hay documentos
        return Stream<Map<String, dynamic>>.value(<String, dynamic>{});
      }

      // Obtiene el primer documento y mantiene los cambios futuros
      final QueryDocumentSnapshot<Map<String, dynamic>> doc =
          querySnapshot.docs.first;
      return doc.reference
          .snapshots()
          .map((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
        return documentSnapshot.data() ?? <String, dynamic>{};
      });
    });
  }
}
