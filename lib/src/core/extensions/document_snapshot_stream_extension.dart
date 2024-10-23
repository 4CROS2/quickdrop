import 'package:cloud_firestore/cloud_firestore.dart';

extension DocumentSnapshotStreamExtensions
    on Stream<DocumentSnapshot<Map<String, dynamic>>> {
  // Método para convertir el Stream<DocumentSnapshot> en Stream<Map<String, dynamic>>
  Stream<Map<String, dynamic>> toMapJsonStream() {
    return map((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      // Obtener los datos del snapshot
      final Map<String, dynamic>? data = snapshot.data();
      if (data == null) {
        // Devuelve un mapa vacío si no hay datos
        return <String, dynamic>{};
      }

      // Crear un nuevo mapa e incluir el ID del documento
      final Map<String, dynamic> mapData = Map<String, dynamic>.from(data);
      // Añadir el ID del documento
      mapData['id'] = snapshot.id;
      return mapData;
    });
  }
}
