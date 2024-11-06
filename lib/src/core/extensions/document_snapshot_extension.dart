import 'package:cloud_firestore/cloud_firestore.dart';

extension DocumentSnapshotExtensions on DocumentSnapshot<Object?> {
  // Método para convertir el DocumentSnapshot en Map<String, dynamic>
  Map<String, dynamic> toJson() {
    if (exists) {
      // Verifica si 'data' no es null antes de hacer el cast
      final Map<String, dynamic>? data = this.data() as Map<String, dynamic>?;
      if (data != null) {
        data['id'] = id;
        return data;
      }
    }
    return <String,
        dynamic>{}; // Retorna un mapa vacío si no existe o si 'data' es null
  }
}
